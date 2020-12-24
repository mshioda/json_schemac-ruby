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

module_eval(<<'...end schema_parser.y/module_eval...', 'schema_parser.y', 347)

private
def camelcase(str)
  str.split("-").inject(nil) {|b, s|
    b ? b + s.capitalize : s
  }
end

def gen_schema_head(datatype, name: nil, id: nil)
  result = {}
  result["$id"] = id if id
  result["title"] = name if name

  if datatype.ref?
    result["$ref"] = datatype.ref
  else
    result["type"] = datatype.type
    result["items"] = datatype.items if datatype.array?
  end

  result
end
...end schema_parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    59,   107,    61,    59,    11,    12,    22,    -2,     5,    26,
    59,    45,    13,     3,    24,    25,    85,    57,    58,    28,
    57,    58,    62,    63,    28,    62,    63,    57,    58,    14,
    59,    20,    62,    63,     8,    -9,    67,    12,    77,    94,
    70,    13,    37,     3,    13,    -9,    38,    57,    58,    16,
    36,    28,    32,    33,    34,    35,    39,    43,    37,    18,
    77,    44,    38,    79,    74,    44,    36,    19,    32,    33,
    34,    35,    39,    28,    37,    73,    50,    51,    38,    29,
    52,    41,    36,    42,    32,    33,    34,    35,    70,     8,
    37,    11,    12,    47,    38,    95,    50,    51,    36,    13,
    52,    33,    34,    35,    32,   101,    90,    91,    39,     8,
    37,    11,    12,    48,    38,    78,    80,    82,    36,    13,
    32,    33,    34,    35,    39,    85,    37,    88,    13,    73,
    38,    99,    13,     8,    36,    11,    12,    33,    34,    35,
   103,   104,   105,    13,   109,    13,    97,   112,   113,   114,
   115,   116,   117,    18 ]

racc_action_check = [
    30,    83,    30,    54,    31,    31,    13,     0,     1,    13,
    55,    25,    31,     0,    13,    13,    83,    30,    30,    13,
    54,    54,    30,    30,    25,    54,    54,    55,    55,     3,
    66,     9,    55,    55,    38,    67,    38,    38,    44,    66,
    38,     9,    38,     4,    38,    67,    38,    66,    66,     5,
    38,    44,    19,    38,    38,    38,    19,    23,    19,     7,
    48,    23,    19,    46,    39,    46,    19,     8,    41,    19,
    19,    19,    41,    48,    41,    39,    29,    29,    41,    14,
    29,    20,    41,    22,    68,    41,    41,    41,    68,     2,
    68,     2,     2,    26,    68,    68,    82,    82,    68,     2,
    82,    68,    68,    68,    74,    74,    60,    60,    74,   117,
    74,   117,   117,    27,    74,    45,    47,    52,    74,   117,
    88,    74,    74,    74,    88,    53,    88,    56,    64,    70,
    88,    73,    75,    69,    88,    69,    69,    88,    88,    88,
    78,    79,    80,    69,    85,    89,    69,    99,   100,   101,
   105,   106,   109,   111 ]

racc_action_pointer = [
     7,     8,    87,    24,    37,    49,   nil,    49,    64,    29,
   nil,   nil,   nil,     1,    72,   nil,   nil,   nil,   nil,    48,
    78,   nil,    70,    44,   nil,     6,    77,    96,   nil,    72,
    -2,     0,   nil,   nil,   nil,   nil,   nil,   nil,    32,    59,
   nil,    64,   nil,   nil,    33,   100,    48,   111,    55,   nil,
   nil,   nil,   112,    99,     1,     8,   124,   nil,   nil,   nil,
   102,   nil,   nil,   nil,   116,   nil,    28,    33,    80,   131,
   113,   nil,   nil,   126,   100,   120,   nil,   nil,   127,   128,
   133,   nil,    92,   -10,   nil,   139,   nil,   nil,   116,   133,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   138,
   139,   140,   nil,   nil,   nil,   137,   142,   nil,   nil,   125,
   nil,   143,   nil,   nil,   nil,   nil,   nil,   107,   nil,   nil ]

racc_action_default = [
   -13,   -65,   -65,   -65,   -13,   -65,    -1,   -18,   -65,   -65,
    -8,    -9,   -10,   -65,   -65,   -12,   120,    -3,   -58,   -65,
   -65,    -7,   -27,   -65,   -21,   -65,   -65,   -65,   -28,   -65,
   -31,   -65,   -38,   -39,   -40,   -41,   -42,   -34,   -65,   -65,
   -56,   -65,   -19,   -20,   -65,   -27,   -65,   -65,   -65,   -11,
   -14,   -15,   -65,   -63,   -31,   -31,   -65,   -35,   -36,   -37,
   -65,   -57,   -59,   -60,   -65,    -6,   -65,   -38,   -65,   -65,
   -65,   -47,   -52,   -65,   -65,   -65,   -26,   -27,   -65,   -65,
   -65,   -25,   -65,   -65,   -61,   -65,   -29,   -30,   -65,   -65,
   -50,   -51,    -4,   -33,   -43,   -44,   -48,   -45,   -53,   -65,
   -65,   -65,    -5,   -22,   -23,   -65,   -65,   -17,   -62,   -65,
   -32,   -18,   -46,   -54,   -55,   -24,   -16,   -65,   -49,   -64 ]

racc_goto_table = [
     6,    17,    21,    31,    71,    84,    49,    53,    23,     2,
    76,     1,    64,    15,    81,    30,    83,    93,    66,    68,
    46,    69,    89,   nil,    65,    75,   nil,   nil,   nil,   nil,
   nil,    86,    87,   nil,    96,   108,    72,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    92,   100,   106,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    98,   102,   nil,
   nil,   nil,   110,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   111,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   118,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   119 ]

racc_goto_check = [
     3,     5,     8,     6,    20,    25,    10,    12,    14,     2,
    15,     1,     7,     2,    15,    11,    13,    16,    19,    21,
    14,    22,    24,   nil,     8,     6,   nil,   nil,   nil,   nil,
   nil,    12,    12,   nil,    20,    25,     3,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     8,     6,    10,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     3,     8,   nil,
   nil,   nil,     6,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     8,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     5,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     3 ]

racc_goto_pointer = [
   nil,    11,     9,    -2,   nil,    -6,   -16,   -19,    -7,   nil,
   -23,    -3,   -23,   -37,    -5,   -34,   -49,   nil,   nil,   -19,
   -34,   -19,   -17,   nil,   -38,   -48 ]

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
  4, 32, :_reduce_6,
  2, 32, :_reduce_7,
  1, 32, :_reduce_8,
  1, 35, :_reduce_none,
  1, 35, :_reduce_none,
  4, 37, :_reduce_11,
  2, 30, :_reduce_none,
  0, 30, :_reduce_13,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  4, 38, :_reduce_16,
  5, 33, :_reduce_17,
  0, 33, :_reduce_18,
  3, 36, :_reduce_19,
  3, 36, :_reduce_20,
  2, 36, :_reduce_21,
  5, 36, :_reduce_22,
  5, 36, :_reduce_23,
  6, 36, :_reduce_24,
  3, 42, :_reduce_25,
  3, 42, :_reduce_26,
  1, 43, :_reduce_none,
  1, 43, :_reduce_none,
  2, 40, :_reduce_29,
  2, 40, :_reduce_30,
  0, 40, :_reduce_31,
  3, 44, :_reduce_32,
  2, 47, :_reduce_33,
  0, 47, :_reduce_34,
  1, 46, :_reduce_none,
  1, 46, :_reduce_36,
  1, 46, :_reduce_37,
  1, 48, :_reduce_none,
  1, 48, :_reduce_none,
  1, 48, :_reduce_none,
  1, 48, :_reduce_none,
  1, 48, :_reduce_none,
  3, 48, :_reduce_43,
  3, 48, :_reduce_44,
  3, 48, :_reduce_45,
  4, 48, :_reduce_46,
  1, 49, :_reduce_47,
  2, 49, :_reduce_48,
  4, 45, :_reduce_49,
  1, 52, :_reduce_none,
  1, 52, :_reduce_51,
  1, 50, :_reduce_52,
  2, 50, :_reduce_53,
  4, 34, :_reduce_54,
  4, 34, :_reduce_55,
  1, 34, :_reduce_none,
  2, 39, :_reduce_57,
  0, 39, :_reduce_58,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  1, 41, :_reduce_none,
  2, 41, :_reduce_62,
  0, 41, :_reduce_63,
  4, 53, :_reduce_64 ]

racc_reduce_n = 65

racc_shift_n = 120

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

    result = gen_schema_head(type, name: name, id: id)
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 29)
  def _reduce_5(val, _values, result)
        name, kywd, _, id, type = val
    raise "Invalid keyword: `$#{kywd}'" if kywd != "id"

    result = gen_schema_head(type, name: name, id: id)
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 36)
  def _reduce_6(val, _values, result)
        kywd, _, id, type = val
    raise "Invalid keyword: `$#{kywd}'" if kywd != "id"

    result = gen_schema_head(type, id: id)
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 43)
  def _reduce_7(val, _values, result)
        name, type = val

    result = gen_schema_head(type, name: name)
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 49)
  def _reduce_8(val, _values, result)
        type = val[0]
    result = gen_schema_head(type)

    # result = {}

    # if type.ref?
    #   result["$ref"] = type.ref
    # else
    #   result["type"] = type.type
    #   result["items"] = type.items if type.array?
    # end
  
    result
  end
.,.,

# reduce 9 omitted

# reduce 10 omitted

module_eval(<<'.,.,', 'schema_parser.y', 67)
  def _reduce_11(val, _values, result)
        _, id, _, value = val
    @vars[id] = value
  
    result
  end
.,.,

# reduce 12 omitted

module_eval(<<'.,.,', 'schema_parser.y', 73)
  def _reduce_13(val, _values, result)
     result = { } 
    result
  end
.,.,

# reduce 14 omitted

# reduce 15 omitted

module_eval(<<'.,.,', 'schema_parser.y', 80)
  def _reduce_16(val, _values, result)
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

module_eval(<<'.,.,', 'schema_parser.y', 97)
  def _reduce_17(val, _values, result)
        result = val[1].merge(val[2]).merge(val[3])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 101)
  def _reduce_18(val, _values, result)
        result = { }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 107)
  def _reduce_19(val, _values, result)
        result = DataType.new(type: val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 111)
  def _reduce_20(val, _values, result)
        result = DataType.new(type: val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 115)
  def _reduce_21(val, _values, result)
        result = DataType.new(type: "object")
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 119)
  def _reduce_22(val, _values, result)
        result = DataType.new(type: "array", items: val[2])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 123)
  def _reduce_23(val, _values, result)
        result = DataType.new(type: "array", items: val[2])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 127)
  def _reduce_24(val, _values, result)
        id = val[3]
    result = DataType.new(ref: "#/$defs/#{id}")
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 134)
  def _reduce_25(val, _values, result)
        result = [val[0], val[2]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 138)
  def _reduce_26(val, _values, result)
        result = [*val[0], val[2]]
  
    result
  end
.,.,

# reduce 27 omitted

# reduce 28 omitted

module_eval(<<'.,.,', 'schema_parser.y', 146)
  def _reduce_29(val, _values, result)
        result = val[0].merge(val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 150)
  def _reduce_30(val, _values, result)
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

module_eval(<<'.,.,', 'schema_parser.y', 162)
  def _reduce_31(val, _values, result)
        result = {}
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 167)
  def _reduce_32(val, _values, result)
        result = {
      val[0] => val[2]
    }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 175)
  def _reduce_33(val, _values, result)
        result = val[0].merge(val[1])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 179)
  def _reduce_34(val, _values, result)
        result = {}
  
    result
  end
.,.,

# reduce 35 omitted

module_eval(<<'.,.,', 'schema_parser.y', 186)
  def _reduce_36(val, _values, result)
        result = camelcase(val[0])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 190)
  def _reduce_37(val, _values, result)
        key = camelcase(val[0])
    result = "$#{key}"
  
    result
  end
.,.,

# reduce 38 omitted

# reduce 39 omitted

# reduce 40 omitted

# reduce 41 omitted

# reduce 42 omitted

module_eval(<<'.,.,', 'schema_parser.y', 198)
  def _reduce_43(val, _values, result)
        result = val[1]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 202)
  def _reduce_44(val, _values, result)
        result = val[1]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 206)
  def _reduce_45(val, _values, result)
        result = [*val[1]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 210)
  def _reduce_46(val, _values, result)
        id = val[2]
    result = "#/$defs/#{id}"
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 217)
  def _reduce_47(val, _values, result)
        result = [val[0]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 221)
  def _reduce_48(val, _values, result)
        result = [*val[0], val[1]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 227)
  def _reduce_49(val, _values, result)
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

# reduce 50 omitted

module_eval(<<'.,.,', 'schema_parser.y', 250)
  def _reduce_51(val, _values, result)
        result = camelcase(val[0])
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 256)
  def _reduce_52(val, _values, result)
        result = [val[0]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 260)
  def _reduce_53(val, _values, result)
        result = [*val[0], val[1]]
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 266)
  def _reduce_54(val, _values, result)
        _, id, value = val

    if @vars[id] && @vars[id].respond_to?(:call)
      result = @vars[id].call(value)
    else
      raise "Invalid identifier `#{id}'"
    end
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 276)
  def _reduce_55(val, _values, result)
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

# reduce 56 omitted

module_eval(<<'.,.,', 'schema_parser.y', 290)
  def _reduce_57(val, _values, result)
        desc = val[0]["description"]

    result = {
      "description" => desc ? [desc, val[1]].join(" ") : val[1]
    }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 296)
  def _reduce_58(val, _values, result)
     result = {} 
    result
  end
.,.,

# reduce 59 omitted

# reduce 60 omitted

# reduce 61 omitted

module_eval(<<'.,.,', 'schema_parser.y', 304)
  def _reduce_62(val, _values, result)
        a = val[0]["$defs"]
    b = val[1]["$defs"] || {}

    result = {
      "$defs" => a.merge(b)
    }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 312)
  def _reduce_63(val, _values, result)
        result = { }
  
    result
  end
.,.,

module_eval(<<'.,.,', 'schema_parser.y', 318)
  def _reduce_64(val, _values, result)
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
