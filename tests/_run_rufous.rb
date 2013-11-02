$LOAD_PATH << File.dirname(__FILE__)

# Use turn gem, if installed
begin
require 'turn/autorun'
Turn.config do |c|
 # use one of output formats:
 # :outline  - turn's original case/test outline mode [default]
 # :progress - indicates progress with progress bar
 # :dotted   - test/unit's traditional dot-progress mode
 # :pretty   - new pretty reporter
 # :marshal  - dump output as YAML (normal run mode only)
 # :cue      - interactive testing
 c.format  = :outline
 # turn on invoke/execute tracing, enable full backtrace
 c.trace   = false
 # use humanized test names (works only with :outline format)
 c.natural = true
end
rescue LoadError
end

# test files, in order to be run

require "_test_helpers"

require "arrays"
require "array_batch"
require "class_getter_setter"
require "class_instance_inheritables"
require "class_instance_variables"
require "class_variables"
require "files_yaml"
require "files_json_or_yaml"
require "global_variables"
require "inheritable_unique_ids"
require "meta_minitest"
require "meta_test"
require "passing_params"
require "puts"
require "respond_to"
require "splats"

require "composite.rb"
