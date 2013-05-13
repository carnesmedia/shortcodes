require "shortcodes/version"

require 'shortcodes/parser'

module Shortcodes

  def self.shortcode(content)
    Parser.new(content).to_html
  end

  def self.register_shortcode(tag, klass)
    Parser.handlers[tag] = klass
  end

  Parser.default_handler = ->(shortcode) { '' }
end

