class SchemaParser
rule
  target:
    declares
    schema
  {
    result = val[1]
  }
  | /* none */
  {
    result = { }
  }

  schema:
    schema_head schema_body
  {
    result = val[0].merge(val[1])
  }

  schema_head:
    KEYWORD_KEY ":" expr schema_name data_type
  {
    kywd, _, id, name, type = val
    raise "Invalid keyword: `$#{kywd}'" if kywd != "id"

    result = gen_schema_head(type, name: name, id: id)
  }
  | schema_name KEYWORD_KEY ":" expr data_type
  {
    name, kywd, _, id, type = val
    raise "Invalid keyword: `$#{kywd}'" if kywd != "id"

    result = gen_schema_head(type, name: name, id: id)
  }
  | KEYWORD_KEY ":" expr data_type
  {
    kywd, _, id, type = val
    raise "Invalid keyword: `$#{kywd}'" if kywd != "id"

    result = gen_schema_head(type, id: id)
  }
  | schema_name data_type
  {
    name, type = val

    result = gen_schema_head(type, name: name)
  }
  | data_type
  {
    type = val[0]
    result = gen_schema_head(type)
  }

  schema_name: STRING | ID

  declare_stmt:
    'var' ID '=' var_value
  {
    _, id, _, value = val
    @vars[id] = value
  }

  declares:
    declare_stmt declares
  | /* none */ { result = { } }

  var_value:
    STRING
  | ID
  | "(" ID var_value ")"
  {
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
  }

  schema_body:
    "{" description attrs_or_props inline_defs "}"
  {
    result = val[1].merge(val[2]).merge(val[3])
  }
  | /* none */
  {
    result = { }
  }

  data_type:
    "<" ID ">"
  {
    result = DataType.new(type: val[1])
  }
  | "<" type_name_list ">"
  {
    result = DataType.new(type: val[1])
  }
  | "<" ">"
  {
    result = DataType.new(type: "object")
  }
  | "<" "[" ID "]" ">"
  {
    result = DataType.new(type: "array", items: val[2])
  }
  | "<" "[" type_name_list "]" ">"
  {
    result = DataType.new(type: "array", items: val[2])
  }
  | "<" "(" "ref" ID ")" ">"
  {
    id = val[3]
    result = DataType.new(ref: "#/$defs/#{id}")
  }

  type_name_list:
    id_or_null "|" id_or_null
  {
    result = [val[0], val[2]]
  }
  | type_name_list "|" id_or_null
  {
    result = [*val[0], val[2]]
  }

  id_or_null: ID | NULL

  attrs_or_props:
    attribute attrs_or_props
  {
    result = val[0].merge(val[1])
  }
  | property attrs_or_props
  {
    props = val.inject({}) {|hsh, v|
      hsh.merge(v["properties"] || {})
    }
    reqs = val.inject([]) {|ary, v|
      ary.concat(v["required"] || [])
    }

    result = val[0].merge(val[1]).merge({ "properties" => props })
    result["required"] = reqs unless reqs.empty?
  }
  | /* none */
  {
    result = {}
  }

  attribute: attr_key ":" expr
  {
    result = {
      val[0] => val[2]
    }
  }

  attribute_list:
    attribute_list attribute
  {
    result = val[0].merge(val[1])
  }
  | /* none */
  {
    result = {}
  }

  attr_key:
    STRING_KEY
  | ID_KEY
  {
    result = camelcase(val[0])
  }
  | KEYWORD_KEY
  {
    key = camelcase(val[0])
    result = "$#{key}"
  }

  attr_value:
    STRING | INT | FLOAT | BOOL | NULL
  | "{" attribute_list "}"
  {
    result = val[1]
  }
  | "[" attr_value_list "]"
  {
    result = val[1]
  }
  | "[" schema_list "]"
  {
    result = [*val[1]]
  }
  | "(" "ref" ID ")"
  {
    id = val[2]
    result = "#/$defs/#{id}"
  }

  attr_value_list:
    attr_value
  {
    result = [val[0]]
  }
  | attr_value_list attr_value
  {
    result = [*val[0], val[1]]
  }

  property:
    required_sign prop_name data_type schema_body
  {
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
  }

  prop_name:
    STRING
  | ID
  {
    result = camelcase(val[0])
  }

  schema_list:
    schema
  {
    result = [val[0]]
  }
  | schema_list schema
  {
    result = [*val[0], val[1]]
  }

  expr:
    "(" ID expr ")"
  {
    _, id, value = val

    if @vars[id] && @vars[id].respond_to?(:call)
      result = @vars[id].call(value)
    else
      raise "Invalid identifier `#{id}'"
    end
  }
  | "(" ID ID ")"
  {
    id = val[1]
    value = @vars[val[2]]

    if @vars[id] && @vars[id].respond_to?(:call)
      result = @vars[id].call(value)
    else
      raise "Invalid identifier `#{id}'"
    end
  }
  | attr_value

  description:
    description STRING
  {
    desc = val[0]["description"]

    result = {
      "description" => desc ? [desc, val[1]].join(" ") : val[1]
    }
  }
  | /* none */ { result = {} }

  required_sign: "+" | "-"

  inline_defs:
    inline_def
  | inline_defs inline_def
  {
    a = val[0]["$defs"]
    b = val[1]["$defs"] || {}

    result = {
      "$defs" => a.merge(b)
    }
  }
  | /* none */ {
    result = { }
  }

  inline_def:
    "def" ID "is" schema
  {
    result = {
      "$defs" => {
        val[1] => val[3]
      }
    }
  }
end

---- header
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

---- inner

def initialize
  super()
  @scanner = SchemaScanner.new
  @vars = { }
end

def parse(str)
  @scanner.scan(str)
  do_parse
end

def next_token
  @scanner.next_token
end

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
