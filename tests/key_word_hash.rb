require 'test/unit'

# Saving a key work association hash, and
# retrieving all associations with keywords found
# in strings

class KeyWordHash < Test::Unit::TestCase

  @associations = {
    :"jim beam" => 1,
    :"beam" => 1,
    :"beam" =>, 2
    :"sun beam" => 2
  }

  @search_strings = [
    "I am gonna drink jim beam tonight!",
    "beam me up, scotty",
    "You are my little sun beam"
  ]

  def test_finding_associations_in_strings

  end
end