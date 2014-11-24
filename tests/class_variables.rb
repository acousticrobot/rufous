require "minitest/autorun"

class ClassVariables < MiniTest::Test

  # Here we see the difference between class, class instance, and instance variables
  # Class variables will trickle down through all subclasses

  class ParentClass
    @variable = "A"
    @@variable = "B"

    def initialize
      @variable = "C"
    end

    def self.instance_variable
      @variable
    end

    def class_variable
       @@variable
    end

    def class_instance_variable
      self.class.instance_variable
    end

    def instance_variable
      @variable
    end
  end

  class ChildClass < ParentClass
    @variable = "1"
    @@variable = "2"

    def initialize
      @variable = "3"
    end
  end

  def test_parent_class_variable_over_written_by_child
    parent = ParentClass.new
    assert_equal("A", parent.class_instance_variable)
    assert_equal("2", parent.class_variable)
    assert_equal("C", parent.instance_variable)
  end

  def test_child_variables_take_precedence
    child = ChildClass.new
    assert_equal("1", child.class_instance_variable)
    assert_equal("2", child.class_variable)
    assert_equal("3", child.instance_variable)
  end
end

# more:
# http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
