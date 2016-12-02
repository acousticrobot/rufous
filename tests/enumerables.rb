require "minitest/autorun"

class EnumberableTests < MiniTest::Test

  def test_building_a_hash_of_arrays

    group_names = ["The Clique", "The Cabal", "The Household", "The Community",
      "The Posse", "The Squad"]

    students = ["Ron Weasley","Fred Weasley","Harry Potter","Hermione Granger",
      "Colin Creevey","Seamus Finnigan","Hannah Abbott","Pansy Parkinson",
      "Zacharias Smith","Blaise Zabini", "Draco Malfoy", "Dean Thomas",
      "Millicent Bulstrode", "Terry Boot", "Ernie Macmillan","Roland Abberlay",
      "Katie Bell", "Regulus Black", "Euan Abercrombie", "Brandon Angel"]

    group_members = group_names.each_with_object({}) do |name, memo|
      memo[name] = []
    end

    students.each_with_index do |student, i|
      group_members[group_names[i%group_names.length]] << student
    end

    assert_equal group_names, ["The Clique", "The Cabal", "The Household", "The Community", "The Posse", "The Squad"]
    assert_equal group_members["The Clique"], ["Ron Weasley", "Hannah Abbott", "Millicent Bulstrode", "Euan Abercrombie"]
  end
end
