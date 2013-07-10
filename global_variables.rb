require 'test/unit'

class MetaTest2 < Test::Unit::TestCase

  def test_global_still_exists_from_other_test
      assert_equal(999, $global_counter)
  end
end