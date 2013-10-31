  def same_elements?(array_one, array_two)
    ((array_one - array_two) + (array_two - array_one)).empty?
  end
