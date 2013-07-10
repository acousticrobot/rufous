require 'test/unit'

class MetaTest < Test::Unit::TestCase

  # All definitions that start with 'test' will be run
  # Tests run in random order within the class

  $global_counter = 0

  def test_that_gets_run
    $global_counter += 1
    assert_equal(true, $global_counter <= 2)
  end

  def test_another_test_that_will_run
    $global_counter += 1
    assert_equal(true, $global_counter <= 2)
  end

  def silent
    $global_counter += 1
    assert_equal(true, "I'll never run")
  end

end

class MetaTest2 < Test::Unit::TestCase

  def test_after
      assert_equal(2, $global_counter)
      # This counter will live on, see global variables
      $global_counter = 999
  end
end