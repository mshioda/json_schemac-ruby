#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.15
# from Racc grammer file "".
#

require 'racc/parser.rb'

class DataType
  def initialize(type: nil, items: nil, ref: nil)
    @type = type
    @items = items
    @ref = ref
  end

  def array?
    !!@items
  end

  def ref?
    !!@ref
  end

  attr_reader :type, :items, :ref
end

class SchemaParser < Racc::Parser

module_eval(<<'...end schema_parser.y/module_eval...', 'schema_parser.y', 367)

private
def camelcase(str)
  str.split("-").inject(nil) {|b, s|
    b ? b + s.capitalize : s
  }
end
...end schema_parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    59,   106,    61,    59,    43,     5,    22,    -2,    44,    26,
    59,    45,    14,     3,    24,    25,    84,    57,    58,    28,
    57,    58,    62,    63,    28,    62,    63,    57,    58,     3,
    59,    20,    62,    63,     8,    -8,    66,    12,    76,    93,
    69,    13,    37,    16,    13,    -8,    38,    57,    58,    18,
    36,    28,    32,    33,    34,    35,    39,    78,    37,    44,
    76,    19,    38,    29,    73,    41,    36,    42,    32,    33,
    34,    35,    39,    28,    37,    72,    50,    51,    38,    47,
    52,    48,    36,    77,    32,    33,    34,    35,    69,     8,
    37,    11,    12,    79,    38,    94,    50,    51,    36,    13,
    52,    33,    34,    35,    32,   100,    11,    12,    39,     8,
    37,    11,    12,    81,    38,    89,    90,    84,    36,    13,
    32,    33,    34,    35,    39,    87,    37,    13,    72,    98,
    38,    13,   102,     8,    36,    11,    12,    33,    34,    35,
   103,   104,   108,    13,    13,   111,    96,   112,   113,   114,
   115,   116,    18 ]

racc_action_check = [
    30,    82,    30,    54,    23,     1,    13,     0,    23,    13,
    55,    25,     3,     0,    13,    13,    82,    30,    30,    13,
    54,    54,    30,    30,    25,    54,    54,    55,    55,     4,
    65,     9,    55,    55,    38,    66,    38,    38,    44,    65,
    38,     9,    38,     5,    38,    66,    38,    65,    65,     7,
    38,    44,    19,    38,    38,    38,    19,    46,    19,    46,
    48,     8,    19,    14,    39,    20,    19,    22,    41,    19,
    19,    19,    41,    48,    41,    39,    29,    29,    41,    26,
    29,    27,    41,    45,    67,    41,    41,    41,    67,     2,
    67,     2,     2,    47,    67,    67,    81,    81,    67,     2,
    81,    67,    67,    67,    73,    73,    31,    31,    73,   116,
    73,   116,   116,    52,    73,    60,    60,    53,    73,   116,
    87,    73,    73,    73,    87,    56,    87,    64,    69,    72,
    87,    74,    77,    68,    87,    68,    68,    87,    87,    87,
    78,    79,    84,    68,    88,    98,    68,    99,   100,   104,
   105,   108,   110 ]

racc_action_pointer = [
     7,     5,    87,     7,    23,    43,   nil,    39,    58,    29,
   nil,   nil,   nil,     1,    56,   nil,   nil,   nil,   nil,    48,
    62,   nil,    54,    -9,   nil,     6,    63,    64,   nil,    72,
    -2,   102,   nil,   nil,   nil,   nil,   nil,   nil,    32,    59,
   nil,    64,   nil,   nil,    33,    68,    42,    88,    55,   nil,
   nil,   nil,   108,    91,     1,     8,   122,   nil,   nil,   nil,
   111,   nil,   nil,   nil,   115,    28,    33,    80,   131,   112,
   nil,   nil,   124,   100,   119,   nil,   nil,   119,   127,   132,
   nil,    92,   -10,   nil,   137,   nil,   nil,   116,   132,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   136,   138,
   139,   nil,   nil,   nil,   136,   141,   nil,   nil,   124,   nil,
   142,   nil,   nil,   nil,   nil,   nil,   107,   nil,   nil ]

racc_action_default = [
   -12,   -64,   -64,   -64,   -12,   -64,    -1,   -17,   -64,   -64,
    -7,    -8,    -9,   -64,   -64,   -11,   119,    -3,   -57,   -64,
   -64,    -6,   -26,   -64,   -20,   -64,   -64,   -64,   -27,   -64,
   -30,   -64,   -37,   -38,   -39,   -40,   -41,   -33,   -64,   -64,
   -55,   -64,   -18,   -19,   -64,   -26,   -64,   -64,   -64,   -10,
   -13,   -14,   -64,   -62,   -30,   -30,   -64,   -34,   -35,   -36,
   -64,   -56,   -58,   -59,   -64,   -64,   -37,   -64,   -64,   -64,
   -46,   -51,   -64,   -64,   -64,   -25,   -26,   -64,   -64,   -64,
   -24,   -64,   -64,   -60,   -64,   -28,   -29,   -64,   -64,   -49,
   -50,    -4,   -32,   -42,   -43,   -47,   -44,   -52,   -64,   -64,
   -64,    -5,   -21,   -22,   -64,   -64,   -16,   -61,   -64,   -31,
   -17,   -45,   -53,   -54,   -23,   -15,   -64,   -48,   -63 ]

racc_goto_table = [
     6,    17,    21,    49,    31,    70,    83,    53,    23,     2,
    75,     1,    64,    15,    80,    30,    82,    92,    65,    67,
    46,    68,    88,   nil,   nil,   nil,    74,   nil,   nil,   nil,
   nil,    85,    86,   nil,    95,   107,    71,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   105,   nil,    91,    99,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    97,   101,   nil,   nil,
   nil,   nil,   109,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   110,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   117,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   118 ]

racc_goto_check = [
     3,     5,     8,    10,     6,    20,    25,    12,    14,     2,
    15,     1,     7,     2,    15,    11,    13,    16,    19,    21,
    14,    22,    24,   nil,   nil,   nil,     6,   nil,   nil,   nil,
   nil,    12,    12,   nil,    20,    25,     3,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    10,   nil,     8,     6,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     3,     8,   nil,   nil,
   nil,   nil,     6,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     8,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     5,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     3 ]

racc_goto_pointer = [
   nil,    11,     9,    -2,   nil,    -6,   -15,   -19,    -7,   nil,
   -26,    -3,   -23,   -37,    -5,   -34,   -48,   nil,   nil,   -19,
   -33,   -19,   -17,   nil,   -38,   -47 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,     7,   nil,   nil,     9,    10,     4,
   nil,   nil,   nil,   nil,   nil,    27,    54,    55,    56,   nil,
    40,   nil,   nil,    60,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  2, 29, :_reduce_1,
  0, 29, :_reduce_2,
  2, 31, :_reduce_3,
  5, 32, :_reduce_4,
  5, 32, :_reduce_5,
  2, 32, :_reduce_6,
  1, 32, :_reduce_7,
  1, 35, :_reduce_none,
  1, 35, :_reduce_none,
  4, 37, :_reduce_10,
  2, 30, :_reduce_none,
  0, 30, :_reduce_12,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  4, 38, :_reduce_15,
  5, 33, :_reduce_16,
  0, 33, :_reduce_17,
  3, 36, :_reduce_18,
  3, 36, :_reduce_19,
  2, 36, :_reduce_20,
  5, 36, :_reduce_21,
  5, 36, :_reduce_22,
  6, 36, :_reduce_23,
  3, 42, :_reduce_24,
  3, 42, :_reduce_25,
  1, 43, :_reduce_none,
  1, 43, :_reduce_none,
  2, 40, :_reduce_28,
  2, 40, :_reduce_29,
  0, 40, :_reduce_30,
  3, 44, :_reduce_31,
  2, 47, :_reduce_32,
  0, 47, :_reduce_33,
  1, 46, :_reduce_none,
  1, 46, :_reduce_35,
  1, 46, :_reduce_36,
  1, 48, :_reduce_none,
  1, 48, :_reduce_none,
  1, 48, :_reduce_none,
  1, 48, :_reduce_none,
  1, 48, :_reduce_none,
  3, 48, :_reduce_42,
  3, 48, :_reduce_43,
  3, 48, :_reduce_44,
  4, 48, :_reduce_45,
  1, 49, :_reduce_46,
  2, 49, :_reduce_47,
  4, 45, :_reduce_48,
  1, 52, :_reduce_none,
  1, 52, :_reduce_50,
  1, 50, :_reduce_51,
  2, 50, :_reduce_52,
  4, 34, :_reduce_53,
  4, 34, :_reduce_54,
  1, 34, :_reduce_none,
  2, 39, :_reduce_56,
  0, 39, :_reduce_57,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  1, 41, :_reduce_none,
  2, 41, :_reduce_61,
  0, 41, :_reduce_62,
  4, 53, :_reduce_63 ]

racc_reduce_n = 64

racc_shift_n = 119

racc_token_table = {
  false => 0,
  :error => 1,
  :KEYWORD_KEY => 2,
  ":" => 3,
  :STRING => 4,
  :ID => 5,
  "var" => 6,
  "=" => 7,
  "(" => 8,
  ")" => 9,
  "{" => 10,
  "}" => 11,
  "<" => 12,
  ">" => 13,
  "[" => 14,
  "]" => 15,
  "ref" => 16,
  "|" => 17,
  :NULL => 18,
  :STRING_KEY => 19,
  :ID_KEY => 20,
  :INT => 21,
  :FLOAT => 22,
  :BOOL => 23,
  "+" => 24,
  "-" => 25,
  "def" => 26,
  "is" => 27 }

racc_nt_base = 28

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "KEYWORD_KEY",
  "\":\"",
  "STRING",
  "ID",
  "\"var\"",
  "\"=\"",
  "\"(\"",
  "\")\"",
  "\"{\"",
  "\"}\"",
  "\"<\"",
  "\">\"",
  "\"[\"",
  "\"]\"",
  "\"ref\"",
  "\"|\"",
  "NULL",
  "STRING_KEY",
  "ID_KEY",
  "INT",
  "FLOAT",
  "BOOL",
  "\"+\"",
  "\"-\"",
  "\"def\"",
  "\"is\"",
  "$start",
  "target",
  "declares",
  "schema",
  "schema_head",
  "schema_body",
  "expr",
  "schema_name",
  "data_type",
  "declare_stmt",
  "var_value",
  "description",
  "attrs_or_props",
  "inline_defs",
  "type_name_list",
  "id_or_null",
  "attribute",
  "property",
  "attr_key",
  "attribute_list",
  "attr_value",
  "attr_value_list",
  "schema_list",
  "required_sign",
  "prop_name",
  "inline_def" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'schema_parser.y', 6)
  def _reduce_1(val, _values, result)
        result = val[1]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 10)
  def _reduce_2(val, _values, result)
        result = { }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 16)
  def _reduce_3(val, _values, result)
        result = val[0].merge(val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 22)
  def _reduce_4(val, _values, result)
        kywd, _, id, name, type = val
    raise "Invalid keyword: `$#{kywd}'" if kywd != "id"

    result = {
      "$id" => id,
      "title" => name
    }

    if type.ref?
      result["$ref"] = type.ref
    else
      result["type"] = type.type
      result["items"] = type.items if type.array?
    end
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 39)
  def _reduce_5(val, _values, result)
        name, kywd, _, id, type = val
    raise "Invalid keyword: `$#{kywd}'" if kywd != "id"

    result = {
      "$id" => id,
      "title" => name,
    }

    if type.ref?
      result["$ref"] = type.ref
    else
      result["type"] = type.type
      result["items"] = type.items if type.array?
    end
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 56)
  def _reduce_6(val, _values, result)
        name, type = val

    result = {
      "title" => name,
    }

    if type.ref?
      result["$ref"] = type.ref
    else
      result["type"] = type.type
      result["items"] = type.items if type.array?
    end
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 71)
  def _reduce_7(val, _values, result)
        type = val[0]
    result = {}

    if type.ref?
      result["$ref"] = type.ref
    else
      result["type"] = type.type
      result["items"] = type.items if type.array?
    end
  
    result
  end
.,.,

# reduce 8 omitted

# reduce 9 omitted

module_eval(<<'.,.,', 'schema_parser.y', 87)
  def _reduce_10(val, _values, result)
        _, id, _, value = val
    @vars[id] = value
  
    result
  end
.,.,

# reduce 11 omitted

module_eval(<<'.,.,', 'schema_parser.y', 93)
  def _reduce_12(val, _values, result)
     result = { } 
    result
  end
.,.,

# reduce 13 omitted

# reduce 14 omitted

module_eval(<<'.,.,', 'schema_parser.y', 100)
  def _reduce_15(val, _values, result)
        _, id, arg = val
    fnc = nil

    if BUILT_INS[id]
      fnc = BUILT_INS[id].call(arg)
    elsif @vars[id] && @vars[id].respond_to?(:call)
      fnc = @vars[id]
    else
      raise "Invalid identifier: `#{id}'"
    end

    result = fnc
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 117)
  def _reduce_16(val, _values, result)
        result = val[1].merge(val[2]).merge(val[3])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 121)
  def _reduce_17(val, _values, result)
        result = { }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 127)
  def _reduce_18(val, _values, result)
        result = DataType.new(type: val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 131)
  def _reduce_19(val, _values, result)
        result = DataType.new(type: val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 135)
  def _reduce_20(val, _values, result)
        result = DataType.new(type: "object")
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 139)
  def _reduce_21(val, _values, result)
        result = DataType.new(type: "array", items: val[2])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 143)
  def _reduce_22(val, _values, result)
        result = DataType.new(type: "array", items: val[2])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 147)
  def _reduce_23(val, _values, result)
        id = val[3]
    result = DataType.new(ref: "#/$defs/#{id}")
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 154)
  def _reduce_24(val, _values, result)
        result = [val[0], val[2]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 158)
  def _reduce_25(val, _values, result)
        result = [*val[0], val[2]]
  
    result
  end
.,.,

# reduce 26 omitted

# reduce 27 omitted

module_eval(<<'.,.,', 'schema_parser.y', 166)
  def _reduce_28(val, _values, result)
        result = val[0].merge(val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 170)
  def _reduce_29(val, _values, result)
        props = val.inject({}) {|hsh, v|
      hsh.merge(v["properties"] || {})
    }
    reqs = val.inject([]) {|ary, v|
      ary.concat(v["required"] || [])
    }

    result = val[0].merge(val[1]).merge({ "properties" => props })
    result["required"] = reqs unless reqs.empty?
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 182)
  def _reduce_30(val, _values, result)
        result = {}
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 187)
  def _reduce_31(val, _values, result)
        result = {
      val[0] => val[2]
    }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 195)
  def _reduce_32(val, _values, result)
        result = val[0].merge(val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 199)
  def _reduce_33(val, _values, result)
        result = {}
  
    result
  end
.,.,

# reduce 34 omitted

module_eval(<<'.,.,', 'schema_parser.y', 206)
  def _reduce_35(val, _values, result)
        result = camelcase(val[0])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 210)
  def _reduce_36(val, _values, result)
        key = camelcase(val[0])
    result = "$#{key}"
  
    result
  end
.,.,

# reduce 37 omitted

# reduce 38 omitted

# reduce 39 omitted

# reduce 40 omitted

# reduce 41 omitted

module_eval(<<'.,.,', 'schema_parser.y', 218)
  def _reduce_42(val, _values, result)
        result = val[1]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 222)
  def _reduce_43(val, _values, result)
        result = val[1]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 226)
  def _reduce_44(val, _values, result)
        result = [*val[1]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 230)
  def _reduce_45(val, _values, result)
        id = val[2]
    result = "#/$defs/#{id}"
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 237)
  def _reduce_46(val, _values, result)
        result = [val[0]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 241)
  def _reduce_47(val, _values, result)
        result = [*val[0], val[1]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 247)
  def _reduce_48(val, _values, result)
        required, name, type, schema = val

    if type.ref?
      prop = {
        name => { "$ref" => type.ref }
      }
    else
      prop = {
        name => { "type" => type.type }
      }
      prop[name]["items"] = type.items if type.array?
    end

    prop[name].merge!(schema)

    result = { "properties" => prop }
    result["required"] = [name] if required == "+"
  
    result
  end
.,.,

# reduce 49 omitted

module_eval(<<'.,.,', 'schema_parser.y', 270)
  def _reduce_50(val, _values, result)
        result = camelcase(val[0])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 276)
  def _reduce_51(val, _values, result)
        result = [val[0]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 280)
  def _reduce_52(val, _values, result)
        result = [*val[0], val[1]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 286)
  def _reduce_53(val, _values, result)
        _, id, value = val

    if @vars[id] && @vars[id].respond_to?(:call)
      result = @vars[id].call(value)
    else
      raise "Invalid identifier `#{id}'"
    end
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 296)
  def _reduce_54(val, _values, result)
        id = val[1]
    value = @vars[val[2]]

    if @vars[id] && @vars[id].respond_to?(:call)
      result = @vars[id].call(value)
    else
      raise "Invalid identifier `#{id}'"
    end
  
    result
  end
.,.,

# reduce 55 omitted

module_eval(<<'.,.,', 'schema_parser.y', 310)
  def _reduce_56(val, _values, result)
        desc = val[0]["description"]

    result = {
      "description" => desc ? [desc, val[1]].join(" ") : val[1]
    }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 316)
  def _reduce_57(val, _values, result)
     result = {} 
    result
  end
.,.,

# reduce 58 omitted

# reduce 59 omitted

# reduce 60 omitted

module_eval(<<'.,.,', 'schema_parser.y', 324)
  def _reduce_61(val, _values, result)
        a = val[0]["$defs"]
    b = val[1]["$defs"] || {}

    result = {
      "$defs" => a.merge(b)
    }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 332)
  def _reduce_62(val, _values, result)
        result = { }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 338)
  def _reduce_63(val, _values, result)
        result = {
      "$defs" => {
        val[1] => val[3]
      }
    }
  
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class SchemaParser
