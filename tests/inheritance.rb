
class BaseMethod

  def perform
    log = []
    log << self.initialize_message
    log << "doing the work"
    log << self.success_message
    return log
  end

  def initialize_message
    "starting the work"
  end

  def success_message
    "finished the work"
  end
end

class ChildMethod < BaseMethod
  def initialize_message
    "starting the specific work"
  end

  def success_message
    "finished the specific work"
  end
end

class InheritanceTest < MiniTest::Test
  def test_child_message
    assert_equal ChildMethod.new.perform, ["starting the specific work","doing the work","finished the specific work"]
  end
end
