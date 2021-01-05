require 'test/unit'
require_relative '../lib/schema_scanner'

class TestSchemaScanner < Test::Unit::TestCase
  def setup
    @scanner = SchemaScanner.new
  end

  def test_parse_id_of_one_letter
    @scanner.scan('a')
    assert_equal([:ID, 'a'], next_token)
  end

  def test_parse_id
    @scanner.scan('foo')
    assert_equal([:ID, 'foo'], next_token)
  end

  def test_parse_string
    @scanner.scan('"foo"')
    assert_equal([:STRING, 'foo'], next_token)
  end

  def test_parse_string_includes_escape_sequence
    @scanner.scan('"foo\nbaa"')
    assert_equal([:STRING, "foo\nbaa"], next_token)
  end

  def test_parse_string_includes_escape_quotation
    @scanner.scan('"foo\"baa"')
    assert_equal([:STRING, "foo\"baa"], next_token)
  end

  def test_parse_keyword_key_of_one_letter
    @scanner.scan('$x')
    assert_equal([:KEYWORD_KEY, 'x'], next_token)
  end

  def test_parse_keyword_key
    @scanner.scan('$foo-baa')
    assert_equal([:KEYWORD_KEY, 'foo-baa'], next_token)
  end

  def test_parse_vocabulary
    @scanner.scan('@foo-baa')
    assert_equal([:ID_KEY, 'foo-baa'], next_token)
  end

  def test_parse_float
    @scanner.scan('1.234')
    assert_equal([:FLOAT, 1.234], next_token)
  end

  def test_parse_float_with_e
    @scanner.scan('0.789e2')
    assert_equal([:FLOAT, 0.789e2], next_token)
  end

  def test_parse_int
    @scanner.scan('123')
    assert_equal([:INT, 123], next_token)
  end

  def test_parse_negative_int
    @scanner.scan('-567')
    assert_equal([:INT, -567], next_token)
  end

  def test_parse_int_and_brace
    @scanner.scan('12}')
    assert_equal([:INT, 12], next_token)
    assert_equal(['}', '}'], next_token)
  end

  def test_parse_true
    @scanner.scan('true')
    assert_equal([:BOOL, true], next_token)
  end

  def test_parse_false
    @scanner.scan('false')
    assert_equal([:BOOL, false], next_token)
  end

  def test_parse_minus_sign
    @scanner.scan('-a')
    assert_equal(['-', '-'], next_token)
    assert_equal([:ID, 'a'], next_token)
  end

  def test_parse_wrong_id
    @scanner.scan('1ab')
    assert_equal(['1ab', '1ab'], next_token)
  end

  private

  def next_token
    @scanner.next_token
  end
end
