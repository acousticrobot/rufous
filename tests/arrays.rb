require 'test/unit'

class ArrayTests < Test::Unit::TestCase

  def test_array_equivalence
    assert( same_elements?( ['a','b','c'], ['a','b','c'] ), "in the same order")
    assert( same_elements?( ['c','b','a'], ['a','b','c'] ), "out of order" )
    assert( !same_elements?( ['C','b','a'], ['a','b','c'] ), "case sensitive" )
    assert( !same_elements?( [1,'b','a'], ['1','b','c'] ), "numbers != to strings")
  end

  def test_does_not_handle_repeating_elements
    assert( same_elements?( ['c','c','b','a'], ['a','b','c'] ), "repeating an element" )
  end
end
