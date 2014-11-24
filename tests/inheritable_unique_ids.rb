require "minitest/autorun"

class InheritableUniqueIds < MiniTest::Test

  class Family
    attr_reader :id

    def initialize (name)
      self.class.add_member name
      @id = self.class.counter
      self.class.increase_counter
    end

    def self.members
      @members
    end

    def self.counter
      @counter ||= 1
    end

    protected
      def self.add_member( member_name )
        @members ||=[]
        @members << member_name
      end

      def self.increase_counter
        @counter = @counter.next
      end
  end

  class Montague < Family

    def initialize (name)
      super
    end
  end

  class Capulet < Family

    def initialize (name)
      super
    end
  end

  def test_making_unique_ids_inheritable

    romeo = Montague.new "Romeo"
    benvolio = Montague.new "Benvolio"
    mercutio = Montague.new "Mercutio"

    juliet = Capulet.new "Juliet"
    rosaline = Capulet.new "Rosaline"
    tybalt = Capulet.new "Tybalt"

    assert_equal( 1, romeo.id)
    assert_equal( 2, benvolio.id)
    assert_equal( 3, mercutio.id)
    assert_equal( 1, juliet.id)
    assert_equal( 2, rosaline.id)
    assert_equal( 3, tybalt.id)
  end
end
