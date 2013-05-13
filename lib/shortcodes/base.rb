module Shortcodes
  class Base
    attr_reader :node, :shortcode, :attributes
    class_attribute :handlers
    class_attribute :default_handler

    def initialize(content)
      content.gsub(/\[[^\]]+\]/) do |code|
        code = Sanitize.clean(code).gsub(/^\[/, '<').gsub(/\]$/, '>')
        doc = Nokogiri::XML.parse(code)

        @node = doc.root
        @shortcode = node.name
        @attributes = parse_attributes(node)
      end
    end

    def parse_attributes(node)
      Hash[node.to_a]
    end

    def handler
      handlers.fetch(shortcode) { default_handler }
    end

    def to_html
      handler.call attributes
    end
  end
end
