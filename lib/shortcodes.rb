require "shortcodes/version"
require 'active_support/core_ext/class/attribute'

require 'shortcodes/base'
require 'shortcodes/wufoo'
require 'shortcodes/youtube'


module Shortcodes
  autoload 'Nokogiri', 'nokogiri'
  autoload 'Sanitize', 'sanitize'

  def self.shortcode(content)
    Base.new(content).to_html
  end

  Base.handlers = {
    'youtube' => Youtube,
    'wufoo' => Wufoo,
  }

  Base.default_handler = ->(attributes) { '' }
end

