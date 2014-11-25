# encoding: UTF-8

require "minitest/autorun"

class Namable

  def self.name
    "namable class"
  end

  def self.self_identity
    self
  end

  def name
    "namable instance name"
  end

  def self_identity
    self
  end
end

class Encodings < MiniTest::Test

  def test_class_name
    assert_equal Namable.name, "namable class"
  end

  def test_instance_name
    n = Namable.new
    assert_equal n.name, "namable instance name"
  end

  def test_self_on_instance
    n = Namable.new
    assert_equal n.self_identity, n
  end

  def test_self_on_class
    assert_equal Namable.self_identity, Namable
  end
end
