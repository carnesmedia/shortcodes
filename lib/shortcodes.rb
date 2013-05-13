require "shortcodes/version"

require 'shortcodes/parser'

require 'shortcodes/wufoo'
require 'shortcodes/youtube'

module Shortcodes

  def self.shortcode(content)
    Parser.new(content).to_html
  end

  def self.register_shortcode(tag, klass)
    Parser.handlers[tag] = klass
  end

  Parser.default_handler = ->(shortcode) { '' }

  register_shortcode('youtube', Youtube)
  register_shortcode('wufoo', Wufoo)
end

