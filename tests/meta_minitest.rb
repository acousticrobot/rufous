require 'minitest/spec'
require 'minitest/autorun'

# http://mattsears.com/articles/2011/12/10/minitest-quick-reference

describe MiniTest do

  before do
    # minitest preconditions go in a before block
  end

  describe "examine an Array" do
    it "can be created with no arguments" do
      Array.new.must_be_instance_of Array
    end

    it "can be created with a specific size" do
      Array.new(10).size.must_equal 10
    end
  end

  describe "examining errors" do
    it "can raise an error" do
      proc { foo }.must_raise NameError
    end
  end
end