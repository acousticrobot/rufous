require 'test/unit'

class ClassVariables < Test::Unit::TestCase

  # Here we see the difference between class, class instance, and instance variables
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


