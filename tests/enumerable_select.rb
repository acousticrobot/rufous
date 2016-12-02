require "minitest/autorun"

class EnumberableSelectTests < MiniTest::Test

  def test_select_returns_subset
    subset = [1,2,3,4,5].select {|el| el <= 3 }
    assert_equal subset, [1,2,3]
  end

  def pass_select(&eq)
    eq.call([1,2,3,4,5])
  end

  def test_pass_select_as_bloc
    subset = pass_select do |a|
      a.select {|el| el <= 3 }
    end
    assert_equal subset, [1,2,3]
  end
end
