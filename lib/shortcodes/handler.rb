module Shortcodes
  # Abstract Handler
  class Handler

    def self.call(shortcode)
      new(shortcode).render
    end

    attr_reader :shortcode
    def initialize(shortcode)
      @shortcode = shortcode
    end

    def attributes
      shortcode.attributes
    end

    def render
      raise NotImplementedError
    end
  end
end
