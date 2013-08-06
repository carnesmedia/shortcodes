require 'shortcodes/handler'

module Shortcodes
  class Youtube < Handler

    def url
      # TODO: Provide a better interface for missing url
      url = shortcode.attributes.fetch('url')
    end

    def youtube_id
      match = url.match(/(v=|youtu.be\/)([a-zA-Z0-9_-]{11}+)/)

      match ? match[2] : nil
    end

    def time
      t = url[/(t=[0-9msh]+)/]
      t ? "##{t}" : nil
    end

    def height
      attributes.fetch('height', 315)
    end

    def width
      attributes.fetch('width', 560)
    end

    def render
      %Q{<iframe width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{youtube_id}#{time}" frameborder="0" allowfullscreen></iframe>}
    end

    Shortcodes.register_shortcode('youtube', self)
  end
end
