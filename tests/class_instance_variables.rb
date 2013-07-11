require 'test/unit'

class UniqeIdTest < Test::Unit::TestCase

  class Family
    attr_accessor :name, :id
    @surname = "Zappa"
    @members = []
    @ids = 0

    class << self
      attr_accessor :members, :ids
      attr_reader :surname
    end

    def self.members=(name)
      @members << name
    end

    def initialize( name )
      @name = name
      self.class.members << name
      self.class.ids += 1
      @id = self.class.ids
    end

    def full_name
      "#{name} #{self.class.surname}"
    end
  end

  def test_class_instance_variable
    father = Family.new("Frank")
    mother = Family.new("Adelaide")
    older_sister = Family.new("Moon")
    older_brother = Family.new("Dweezil")
    younger_brother = Family.new("Ahmet")
    younger_sister = Family.new("Diva")

    assert_equal( "Dweezil Zappa", older_brother.full_name )
    assert_equal( 6, younger_sister.id)
    assert_equal( ["Frank", "Adelaide", "Moon", "Dweezil", "Ahmet", "Diva"], Family.members)
  end
end