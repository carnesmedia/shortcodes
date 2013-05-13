require "shortcodes/version"

require 'shortcodes/wufoo'
require 'shortcodes/youtube'

module Shortcodes
  autoload 'Nokogiri', 'nokogiri'
  autoload 'Sanitize', 'sanitize'

  HANDLERS = {
    'youtube' => 'youtube',
    'wufoo' => 'wufoo',
  }


  def self.youtube(attributes)
    Youtube.call(attributes)
  end

  def self.wufoo(attributes)
    Wufoo.call(attributes)
  end

  def self.shortcode(content)
    Base.new(content).to_html
  end

  class Base
    attr_reader :node, :shortcode, :attributes

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

    def to_html
      if HANDLERS[shortcode]
        Shortcodes.send(shortcode, attributes)
      end
    end
  end

end
