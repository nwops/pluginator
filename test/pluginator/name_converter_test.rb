=begin
Copyright 2013-2017 Michal Papis <mpapis@gmail.com>

This file is part of pluginator.

pluginator is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pluginator is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pluginator.  If not, see <http://www.gnu.org/licenses/>.
=end

require "test_helper"
require "pluginator/name_converter"

class Converter
  extend Pluginator::NameConverter
end
class PuppetDebugger
end

describe Pluginator::NameConverter do
  describe "classes" do
    it :builds_class do
      Converter.send(:name2class, "Converter").must_equal(Converter)
    end

    it :builds_class_with_dash do
      Converter.send(:name2class, "puppet-debugger").must_equal(PuppetDebugger)
    end

    it :builds_class_with_underscore do
      Converter.send(:name2class, "puppet_debugger").must_equal(PuppetDebugger)
    end
  end
end
