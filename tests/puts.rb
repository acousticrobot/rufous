# Test output resulting from any call to puts
#
# http://thinkingdigitally.com/archive/capturing-output-from-puts-in-ruby/
#
# "We extended the Kernel module with a method called capture_stdout.
# capture_stdout works by redirecting $stdout to an instance of StringIO.
# StringIO has all of the IO methods, but acts on a string instead of a file.
# After changing $stdout we yield to let the caller generate output.
# Once the yield is finished, we return the StringIO instance and add an
# ensure to guarantee that $stdout is reset to its default value.
# Adding capture_stdout to the Kernel module has the effect of giving
# capture_stdout a global scope so that it can be used anywhere."
#
require 'stringio'

module Kernel

  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end

class PutsOutputTest < MiniTest::Test

  def test_capture_puts
    out = capture_stdout do
      puts "Capture this!"
      puts "And this!"
    end

    assert_equal "Capture this!\nAnd this!\n", out.string
  end

end
