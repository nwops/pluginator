require 'minitest/autorun'
require 'pluginator/extendable_autodetect'

describe Pluginator::ExtendableAutodetect do
  it "loads existing extensions - array" do
    pluginator = Pluginator::ExtendableAutodetect.new("something", extends: %i{conversions})
    pluginator.public_methods.must_include(:class2string)
    pluginator.public_methods.must_include(:string2class)
    pluginator.public_methods.wont_include(:plugins_map)
  end

  it "loads existing extensions - symbol" do
    pluginator = Pluginator::ExtendableAutodetect.new("something", extends: :conversions)
    pluginator.public_methods.must_include(:class2string)
    pluginator.public_methods.must_include(:string2class)
    pluginator.public_methods.wont_include(:plugins_map)
  end

  it "fails to load missing extension" do
    lambda {
      Pluginator::ExtendableAutodetect.new("something", extends: %i{missing_conversions})
    }.must_raise(Pluginator::MissingPlugin)
  end
end
