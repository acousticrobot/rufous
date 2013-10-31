require 'json'

class Files < Test::Unit::TestCase

  def setup
    @dir = File.join(Dir.home,".rufous")
    Dir.mkdir(@dir, 0700) unless File.exists?(@dir)
    @j_file = File.join( @dir, "json_test.json")
    @y_file = File.join( @dir, "yaml_test.yaml")
  end

  def teardown
    # FileUtils.rm_r @dir if File.exists?(@dir)
  end

  class JsonReaderWriter

    def save(filename, obj)
      File.open( filename,"w" ) do |f|
        f.write( obj.to_json )
      end
    end

    def read( filename )
      File.open( filename, "r" ) do |f|
        JSON.load( f )
      end
    end
  end

  class YamlReaderWriter
    def save(filename, obj)
      File.open( filename,"w" ) do |f|
        f.puts YAML::dump( obj )
      end
    end

    def read( filename )
      File.open( filename, "r" ) do |f|
        params = YAML.load_file( f )
      end
    end
  end

  def test_writing_and_reading_a_file
    record = {landscape_inner_width: '1488',
              landscape_inner_height: '837',
              landscape_offset: { x: '156', y: '170' },
              portrait_inner_width: '680',
              portrait_inner_height: '1200',
              portrait_offset: { x: '564', y: '0'},
              square_inner_width: '1044',
              square_inner_height: '1044',
              square_offset: { x: '678', y: '79'}
            }

    j_util = JsonReaderWriter.new
    y_util = YamlReaderWriter.new

    # j_util.save @j_file, record
    # y_util.save @y_file, record

    j_record = j_util.read @j_file
    y_record = y_util.read @y_file

    assert_equal record, y_record

    # JSON changes symbols to strings
    assert_not_equal record, j_record
  end
end