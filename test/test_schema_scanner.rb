require 'test/unit'
require_relative '../lib/schema_scanner'

class SchemaParser
  def do_parse
  end
end

class TestSchemaScanner < Test::Unit::TestCase
  def setup
    @parser = SchemaParser.new
  end

  def test_parse_id_of_one_letter
    @parser.parse('a')
    assert_equal([:ID, 'a'], next_token)
  end

  def test_parse_id
    @parser.parse('foo')
    assert_equal([:ID, 'foo'], next_token)
  end

  def test_parse_string
    @parser.parse('"foo"')
    assert_equal([:STRING, 'foo'], next_token)
  end

  def test_parse_string_includes_escape_sequence
    @parser.parse('"foo\nbaa"')
    assert_equal([:STRING, "foo\nbaa"], next_token)
  end

  def test_parse_string_includes_escape_quotation
    @parser.parse('"foo\"baa"')
    assert_equal([:STRING, "foo\"baa"], next_token)
  end

  def test_parse_keyword_key_of_one_letter
    @parser.parse('$x')
    assert_equal([:KEYWORD_KEY, 'x'], next_token)
  end

  def test_parse_keyword_key
    @parser.parse('$foo-baa')
    assert_equal([:KEYWORD_KEY, 'foo-baa'], next_token)
  end

  def test_parse_vocabulary
    @parser.parse('@foo-baa')
    assert_equal([:ID_KEY, 'foo-baa'], next_token)
  end

  def test_parse_float
    @parser.parse('1.234')
    assert_equal([:FLOAT, 1.234], next_token)
  end

  def test_parse_float_with_e
    @parser.parse('0.789e2')
    assert_equal([:FLOAT, 0.789e2], next_token)
  end

  def test_parse_int
    @parser.parse('123')
    assert_equal([:INT, 123], next_token)
  end

  def test_parse_negative_int
    @parser.parse('-567')
    assert_equal([:INT, -567], next_token)
  end

  def test_parse_int_and_brace
    @parser.parse('12}')
    assert_equal([:INT, 12], next_token)
    assert_equal(['}', '}'], next_token)
  end

  def test_parse_true
    @parser.parse('true')
    assert_equal([:BOOL, true], next_token)
  end

  def test_parse_false
    @parser.parse('false')
    assert_equal([:BOOL, false], next_token)
  end

  def test_parse_minus_sign
    @parser.parse('-a')
    assert_equal(['-', '-'], next_token)
    assert_equal([:ID, 'a'], next_token)
  end

  def test_parse_wrong_id
    @parser.parse('1ab')
    assert_equal(['1ab', '1ab'], next_token)
  end

  private

  def next_token
    @parser.next_token
  end
end
