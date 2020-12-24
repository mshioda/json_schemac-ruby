class SchemaParser
  NONE = []
  KEYWORDS = %w[
    def
    is
    ref
    var
  ]

  SCANNERS = {
    /\s+/ => ->(s) { NONE },

    /#[^\n]*\n/ => ->(s) { NONE },

    />>\s?([^\n]*)\n/ => ->(s) {
      [:STRING, replace_esc(s)]
    },

    /\$"((\\"|[^"])*)"/ => ->(s) {
      [:ID_STR, s]
    },

    /"((\\"|[^"])*)"/ => ->(s) {
      [:STRING, replace_esc(s)]
    },

    /\$([\w][-\d\w]+)/ => ->(s) {
      [:KEYWORD_KEY, s]
    },

    /@([\w][-\d\w]+)/ => ->(s) {
      [:ID_KEY, s]
    },

    /@"((\\"|[^"])*)"/ => ->(s) {
      [:STRING_KEY, s]
    },

    /([\w][-\d\w]+)/ => ->(s) {
      if s == "true" || s == "false"
        [:BOOL, s == "true"]
      elsif s == "null"
        [:NULL, s]
      elsif KEYWORDS.include?(s)
        [s, s]
      else
        [:ID, s]
      end
    },

    /([-+]?\d+(\.\d+)?(e\d+))/ => ->(s) {
      [:FLOAT, s.to_f]
    },

    /([-+]?\d+)/ => ->(s) {
      [:INT, s.to_i]
    },

    /(.|\n)/ => ->(s) {
      [s, s]
    }
  }

  def parse(str)
    @q = []
    @vars = { }

    until str.nil?
      SCANNERS.find do |k, v|
        if str =~ /\A#{k}/ && val = v.call($1)
          @q.push(val) unless val.empty?
          true
        end
      end

      str = $'
    end

    @q.push [false, '$end']

    do_parse
  end

  def next_token
    @q.shift
  end

  BUILT_INS = {
    "join-uri" => ->(arg) {
      ->(*args1) { [arg, *args1].join("/") }
    }
  }
end

def replace_esc(str)
  return str unless str.index("\\")

  return str.gsub(/\\./) do |s|
    case s
    when "\\\\"; "\\"
    when '\"'; '"'
    when '\b'; "\b"
    when '\f'; "\f"
    when '\n'; "\n"
    when '\r'; "\r"
    when '\t'; "\t"
    else
      s
    end
  end
end
