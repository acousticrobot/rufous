require 'test/unit'

class Responder

  def my_method
    "my method called"
  end

  def my_method_with_param param
    "method called with #{param}"
  end

  def has_method? method
    return true if respond_to? method
    false
  end

  def call_if_has_method method
    send method if respond_to? method
  end

  def call_with_param method, param
    send( method, param ) if respond_to? method
  end
end

class ArrayTests < Test::Unit::TestCase

  def can_test_if_class_responds_to_method
    responder = Responder.new
    assert responder.respond_to? "has_method?"
  end

  def test_can_find_own_methods
    responder = Responder.new
    assert responder.has_method? "my_method"
    refute responder.respond_to? "nota_method"
  end

  def test_can_call_own_methods
    responder = Responder.new
    response = responder.call_if_has_method("my_method")
    assert_equal response, "my method called"
  end

  def test_can_call_own_methods_with_param
    responder = Responder.new
    response = responder.call_with_param( "my_method_with_param", "option!")
    assert_equal response, "method called with option!"
  end

end
