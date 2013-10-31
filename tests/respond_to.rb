require 'test/unit'

class Responder

  def my_method
  end

  def has_method? method
    return true if respond_to? method
    false
  end
end

class ArrayTests < Test::Unit::TestCase

  def test_can_find_own_methods
    responder = Responder.new
    assert responder.has_method? "my_method"
    refute responder.respond_to? "nota_method"
  end

end
