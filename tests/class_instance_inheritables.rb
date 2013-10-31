require 'test/unit'

class ClassInstanceInheritables < Test::Unit::TestCase

  # Class instance variables aren't inherited by child classes, but can be managed like this.
  # See also:
  # http://stackoverflow.com/questions/4901208/initializing-class-instance-variables-in-ruby
  # http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/

  class Family

    def initialize (name)
      self.class.add_member name
    end

    def self.members
      @members
    end

    protected
      def self.add_member( member_name )
        @members ||=[]
        @members << member_name
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

  romeo = Montague.new "Romeo"
  benvolio = Montague.new "Benvolio"
  mercutio = Montague.new "Mercutio"

  juliet = Capulet.new "Juliet"
  rosaline = Capulet.new "Rosaline"
  tybalt = Capulet.new "Tybalt"

  def test_making_class_instance_variables_inheritable
    assert( same_elements?( Montague.members, ["Romeo","Benvolio", "Mercutio"] ))
    assert( same_elements?( Capulet.members, ["Juliet", "Rosaline", "Tybalt"] ))
  end
end
