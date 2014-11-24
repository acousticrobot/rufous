require "minitest/autorun"

class  OptionsClass
  attr_reader :options, :own_options

  def initialize options={}
    @options = options
    @own_options = options.clone
  end
end

def params_switch options={}
  options[:change_test] = ! options[:change_test]
end

class PassingParams < MiniTest::Test

  def test_params_are_persistant
    params = {change_test: false}
    params_switch params
    assert params[:change_test]

    # protect the params for iteration
    params_switch params.clone
    assert params[:change_test]
  end

  def test_saving_params_in_class

    params = {change_test: false}
    instance = OptionsClass.new params

    params_switch params
    assert instance.options[:change_test]
    assert ! instance.own_options[:change_test]
  end
end
