require 'test/unit'

class CompositeTests < Test::Unit::TestCase

  class Composite
    attr_accessor :name, :parent, :nodes
    @root_nodes = []

    class << self
      attr_accessor :root_nodes

      def << member
        @root_nodes << member
      end

      def uproot member
        @root_nodes.delete member
      end

      def report_trees
        report = ""
        @root_nodes.each do |m|
          report += "+"
          report += m.report_branches 0
        end
        report
      end
    end

    def initialize( name, parent=:root )
      @name = name
      @parent = parent
      @nodes = []
      self.class << self
    end

    def << member
      @nodes << member
      if member.parent == :root
        self.class.uproot member
      else
        member.parent.delete member
      end
      member.parent = self
    end

    def delete( member )
      @nodes.delete member
      member.parent = nil
    end

    def report_branches( depth )
      report = "-" * depth
      report += self.name
      @nodes.each { |n| report += n.report_branches depth + 1 }
      report
    end
  end

  def setup
    Composite.root_nodes = []
  end

  # tests
  #
  def same_elements?(array_one, array_two)
    ((array_one - array_two) + (array_two - array_one)).empty?
  end

  def test_initialize_a_member
    c1 = Composite.new("root")
    assert_equal c1.name, "root"
    assert_equal c1.parent, :root
    assert_equal c1.nodes, []
    assert_equal Composite.root_nodes, [c1]
  end

  def test_add_root_to_class
    Composite << "sam"
    assert_equal Composite.root_nodes, ["sam"]
  end

  def test_delete_root_from_class
    c1 = Composite.new("root")
    Composite.uproot c1
    assert_equal Composite.root_nodes, []
  end

  def test_add_child
    c1 = Composite.new("root")
    c2 = Composite.new("branch1")
    c1 << c2
    assert_equal c1.nodes, [c2]
    assert_equal c2.parent, c1
    assert_equal Composite.root_nodes, [c1]
  end

  def test_move_child_to_new_parent
    c1 = Composite.new("root1")
    c2 = Composite.new("root2")
    c3 = Composite.new("branch1")
    c1 << c3
    c2 << c3
    assert_equal c1.nodes, []
    assert_equal c2.nodes, [c3]
    assert_equal c3.parent, c2
    assert_equal Composite.root_nodes, [c1,c2]
  end

  def test_remove_child
    c1 = Composite.new("root")
    c2 = Composite.new("branch1")
    c1 << c2
    c1.delete c2
    assert_equal c1.nodes, []
    assert_equal c2.parent, nil
  end

  def test_report_branches
    c1 = Composite.new("root1")
    c2 = Composite.new("branch1")
    c3 = Composite.new("branch2")
    c4 = Composite.new("branch3")
    c1 << c2
    c1 << c3
    c2 << c4
    report = c1.report_branches 0
    assert_equal report, "root1-branch1--branch3-branch2"
  end

  def test_report_trees
    r1 = Composite.new("root1")
    r2 = Composite.new("root2")
    b1 = Composite.new("branch1")
    b2 = Composite.new("branch2")
    b3 = Composite.new("branch3")
    b4 = Composite.new("branch4")
    r1 << b1
    r1 << b2
    b2 << b3
    r2 << b4
    report = Composite.report_trees
    assert_equal report, "+root1-branch1-branch2--branch3+root2-branch4"
  end



end
