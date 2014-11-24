require "minitest/autorun"

class ClassGetterSetters < MiniTest::Test

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

  class HasClassGetterSetter2
    @var = 99

    def self.var
      @var
    end

    def self.var=(value)
      @var = value
    end
  end

  class WithSelfBlock2
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


  def test_has_setter
    HasClassGetterSetter2.var = 80
    WithSelfBlock2.var = 80
    assert_equal WithSelfBlock2.var, 80
    assert_equal HasClassGetterSetter2.var, 80
  end

  def test_is_not_a_method
    exception_1 = assert_raises ArgumentError do
      HasClassGetterSetter.var(70)
    end
    assert_match(/wrong number of arguments \(1 for 0\)/, exception_1.message)

    exception_2 = assert_raises ArgumentError do
      WithSelfBlock.var(70)
    end
    assert_match(/wrong number of arguments \(1 for 0\)/, exception_2.message)
  end
end
