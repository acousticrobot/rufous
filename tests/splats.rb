require 'test/unit'

class SplatsTests < Test::Unit::TestCase

  def echo_splat *splat
    splat
  end

  def test_splat_becomes_an_array
    splat = echo_splat 'a', 'b', 'c', 'd'
    assert_equal ['a','b','c', 'd'], splat
  end

  def test_single_param_still_an_array
    splat = echo_splat 'a'
    assert_equal ['a'], splat
  end

  def test_array_becomes_a_nested_array
    splat = echo_splat ['a','b','c', 'd']
    assert_equal [['a','b','c', 'd']], splat
  end

  def test_pass_array_as_a_splat
    splat = echo_splat *['a','b','c', 'd']
    assert_equal ['a','b','c', 'd'], splat
  end

end
