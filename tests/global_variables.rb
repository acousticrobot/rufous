require 'test/unit'

class MetaTest2 < Test::Unit::TestCase

  def test_global_still_exists_from_other_test
    assert_equal(999, $global_counter)
  end

  def test_global_scope_is_not_confined_to_class
    assert_equal(999, Globals::outside_test)
  end
end



class Globals < Test::Unit::TestCase
  def self.outside_test
    $global_counter
  end

  def test_globals_initialized_and_evaluated_before_tests_are_run
    assert_equal(0, Globals::outside_test)
  end
end