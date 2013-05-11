require_relative "errors"
require_relative "group"
require_relative "name_converter"

module Pluginator
  class Autodetect < Group

    def initialize(group, type: nil)
      super(group)
      setup_autodetect(type)
    end

    def type
      @plugins[@force_type]
    end

  private

    include NameConverter

    def setup_autodetect(type)
      @force_type = type
      load_files(find_files)
    end

    def find_files
      Gem.find_files(file_name_pattern(@group, @force_type))
    end

    def load_files(file_names)
      file_names.each do |file_name|
        path, name, type = split_file_name(file_name, @group)
        load_plugin path
        register_plugin(type, name2class(name))
      end
    end

    def load_plugin(path)
      gemspec = Gem::Specification.find_by_path(path)
      gemspec.activate if gemspec && !gemspec.activated?
      require path
    end

  end
end
