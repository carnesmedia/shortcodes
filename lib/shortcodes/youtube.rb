module Shortcodes
  class Youtube
    def self.call(shortcode)
      url = shortcode.attributes['url']

      match = url.match(/(v=|youtu.be\/)(\w+)/)
      youtube_id = match ? match[2] : nil

      '<iframe width="560" height="315" src="http://www.youtube.com/embed/%s" frameborder="0" allowfullscreen></iframe>' % youtube_id
    end
  end
end
