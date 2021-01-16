require 'test/unit'
require_relative '../lib/schema_parser.tab'
require_relative '../lib/schema_scanner'

class TestSchemaParser < Test::Unit::TestCase
  def setup
    @parser = SchemaParser.new
  end

  def test_parse_blank_object
    actual = @parser.parse("<object> {}")
    assert_equal({ "type" => "object" }, actual)
  end

  def test_parse_built_in_join_uri
    actual = @parser.parse(<<~EOD)
      var root = (join-uri "http://example.com")
      $id: (root "sample.json") <object> { }
    EOD

    assert_equal("http://example.com/sample.json",
                 actual["$id"])
    assert_equal("object", actual["type"])
  end

  def test_parse_built_in_join_uri_with_two_arguments
    actual = @parser.parse(<<~EOS)
      var host = "http://example.com"
      $id: (join-uri host "sample.json") <object> { }
    EOS

    assert_equal({
                   "$id" => "http://example.com/sample.json",
                   "type" => "object"
                 }, actual)
  end
end
