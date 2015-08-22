class StyleStats
  class Css
    attr_accessor :rules, :selectors, :declarations

    def initialize(file)
      parser = CssParser::Parser.new
      parser.load_uri!(file)

      self.rules = []
      self.selectors = []
      self.declarations = {}
      declaration_class = Struct.new(:values, :line_count)
      parser.each_rule_set do |rule|
        self.rules << rule
        rule.each_selector do |selector, declarations, specificity|
          self.selectors << selector
          declarations.split(';').map do |declaration|
            property, value = declaration.split(':')
            property.strip!

            self.declarations[property] = declaration_class.new([], 0) unless self.declarations.has_key?(property)

            self.declarations[property].values << value.strip
            self.declarations[property].line_count += 1
            self.declarations[property].values.uniq!
          end
        end
      end
    end

    def font_family
      self.declarations["font-family"].values
    end

    def font_size
      self.declarations["font-size"].values
    end

    def color
      self.declarations["color"].values
    end

    def declarations_line_count
      self.declarations.inject(0) { |sum, (key, declaration)| sum += declaration.line_count }
    end
  end
end