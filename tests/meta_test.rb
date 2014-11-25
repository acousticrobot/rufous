require "minitest/autorun"

class MetaTest < MiniTest::Test

  def setup
    # set conditions before each test
  end

  def teardown
    # cleanup after each test
  end


  # All definitions that start with 'test' will be run
  # Tests run in random order within the class

  $global_counter = 0

  def test_a_def_starting_with__t_e_s_t__gets_run
    $global_counter += 1
    assert_equal(true, $global_counter <= 2)
  end

  def test_here_is_a__t_e_s_t__that_will_run
    $global_counter += 1
    assert_equal(true, $global_counter <= 2)
  end

  def other_def_with_a_test_that_will_never_run
    $global_counter += 1
    assert_equal(true, "I'll never run")
  end

end

class MetaTest2 < MiniTest::Test

  #Minitest does not run tests in predetermined order

  # def test_after_first_test_results_are_finished
  #     assert_equal(2, $global_counter)
  #     # This counter will live on, see global variables
  #     $global_counter = 999
  # end

  def test_array_tests
    my_array = ["my","ordered", "array"]
    assert_instance_of Array, my_array
    assert_equal ["my", "ordered", "array"], my_array
    refute_equal ["ordered", "my", "array"], my_array
  end

  def test_hash_tests
    my_hash = {my: "hash", is: "awesome"}
    assert_instance_of Hash, my_hash
    assert_equal({my: "hash", is: "awesome"}, my_hash)
    assert_equal({is: "awesome", my: "hash"}, my_hash)
  end

end
