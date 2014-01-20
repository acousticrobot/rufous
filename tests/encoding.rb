# encoding: UTF-8

require 'test/unit'

class Encodings < Test::Unit::TestCase
# For more in-depth look into Ruby string encodings:
#
# http://yehudakatz.com/2010/05/05/ruby-1-9-encodings-a-primer-and-the-solution-for-rails/

  def test_utf_magic_comment_works
    f = "你好"
    assert_equal f, "你好"
  end

  def test_encoding_keyword
    assert_equal __ENCODING__.to_s, "UTF-8"
  end
end