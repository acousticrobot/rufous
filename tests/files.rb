require 'test/unit'
require 'yaml'
require 'pry'

class Files < Test::Unit::TestCase

  def setup
    @dir = File.join(Dir.home,".rufous")
    Dir.mkdir(@dir, 0700) unless File.exists?(@dir)
  end

  def teardown
    # FileUtils.rm_r @dir if File.exists?(@dir)
  end

  def test_writing_and_reading_a_file

    file = File.join( @dir, "write_and_read.txt")
    File.open( file,'w' ) do |f|
      f.puts "sam i am!"
      f.puts "i am sam!"
    end

    contents = []
    File.open(file, "r") do |f|
      f.readlines.each do |line|
        contents << line.chomp
      end
    end

    assert_equal("sam i am!", contents[0])
    assert_equal("i am sam!", contents[1])
  end

  def test_writing_and_reading_yaml
    file = File.join( @dir, "write_and_read_yaml.txt")
    record_in = {name: 'Jerry', hobby: 'berry picker'}

    File.open( file,'w' ) do |f|
      f.puts YAML::dump( record_in )
    end

    record_out = thing = YAML.load_file(file)

    assert_equal(record_in, record_out)
    assert_equal('Jerry',record_out[:name])

  end

  class YamlMammal
    attr_accessor :furry, :name

    def initialize(params)
      @name = params[:name]
      @furry = params[:furry]
    end

    def self.init_from_yaml( file )
      params = YAML.load_file(file)
      YamlMammal.new params
    end

    def self.init_yamls( file )
      zoo = []
      File.open( file ) do |yf|
        YAML.load_documents( yf ) do |params|
          zoo << YamlMammal.new( params )
        end
      end
      zoo
    end

    def store_as_yaml( file )
      record = { name: @name, furry: @furry }
      File.open( file,'a' ) do |f|
        f.puts YAML::dump( record )
      end
    end
  end

  def test_writing_and_reading_a_yaml_object

    file = File.join( @dir, "yaml_mammal.txt")

    pig = YamlMammal.new( name:'Pig', furry: false )
    bear = YamlMammal.new( name:'Bear', furry: true )
    pig.store_as_yaml file
    bear.store_as_yaml file

    beast = YamlMammal.init_from_yaml file

    assert_equal pig.name, beast.name

    animals = YamlMammal.init_yamls file

    assert_equal "Bear", animals[1].name
  end
end



