require 'test/unit'

class ClassGetterSetters < Test::Unit::TestCase

  # see pickaxe p.390 "singletons"

  class HasClassGetterSetter
    @var = 99

    def self.var
      @var
    end

    def self.var=(value)
      @var = value
    end
  end

  class WithSelfBlock
    @var = 99

    class << self
      def var
        @var
      end

      def var=(value)
        @var = value
      end
    end
  end


  def test_has_getter
    assert_equal HasClassGetterSetter.var, 99
    assert_equal WithSelfBlock.var, 99
  end

  def test_has_setter
    HasClassGetterSetter.var = 80
    WithSelfBlock.var = 80
    assert_equal WithSelfBlock.var, 80
    assert_equal HasClassGetterSetter.var, 80
  end

  def test_is_not_a_method
    exception_1 = assert_raise ArgumentError do
      HasClassGetterSetter.var(70)
    end
    assert_match(/wrong number of arguments \(1 for 0\)/, exception_1.message)

    exception_2 = assert_raise ArgumentError do
      WithSelfBlock.var(70)
    end
    assert_match(/wrong number of arguments \(1 for 0\)/, exception_2.message)
  end
end