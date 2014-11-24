require "minitest/autorun"

class ArrayIndexTests < MiniTest::Test


  def test_index_method
    intervals = [600, 3600]

    assert_equal intervals.index { |i| 500 <= i }, 0
    assert_equal intervals.index { |i| 601 <= i }, 1
    assert_equal intervals.index { |i| 4400 <= i }, nil
  end

  def test_lookup_index_in_hash
    intervals = [600, 3600]
    grade_classes = {0 => 'good', 1 => 'fair', nil => 'poor'}

    assert_equal grade_classes[intervals.index { |i| 500 <= i }], 'good'
    assert_equal grade_classes[intervals.index { |i| 601 <= i }], 'fair'
    assert_equal grade_classes[intervals.index { |i| 4400 <= i }], 'poor'
  end

  ## Abstraction to allow expansion of methods

  def response_time_intervals
    [600, 3600]
  end

  def grade_classes
    { 0 => :good, 1 => :fair, nil => :poor }
  end

  def grade_scale(type, value)
    return "" unless value.is_a?(Float) || value.is_a?(Integer)
    intervals = send("#{type}_intervals".to_sym)
    grade_classes[ intervals.index { |i| value <= i } ]
  end

  def response_times_by_grade(response_times)
    response_times.each_with_object(Hash.new(0)) do |r,tally|
      tally[grade_scale("response_time",r)] += 1
    end
  end

  def test_array_index_method
    response_times = [300,400,600,601,800, 900, 1000, 3600, 3605, 100000]

    assert_equal response_times_by_grade(response_times), { good: 3, fair: 5, poor: 2 }
  end
end
