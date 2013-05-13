require "shortcodes/version"

require 'shortcodes/parser'

require 'shortcodes/wufoo'
require 'shortcodes/youtube'


module Shortcodes
  autoload 'Nokogiri', 'nokogiri'
  autoload 'Sanitize', 'sanitize'

  def self.shortcode(content)
    Parser.new(content).to_html
  end

  Parser.handlers = {
    'youtube' => Youtube,
    'wufoo' => Wufoo,
  }

  Parser.default_handler = ->(shortcode) { '' }
end

