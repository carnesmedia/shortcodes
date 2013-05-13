require "shortcodes/version"

module Shortcodes
  autoload 'Nokogiri', 'nokogiri'
  autoload 'Sanitize', 'sanitize'

  HANDLERS = {
    'youtube' => 'youtube',
    'wufoo' => 'wufoo',
  }


  def self.youtube(node)
    url = node.attributes['url'].value

    match = url.match(/(v=|youtu.be\/)(\w+)/)
    youtube_id = match ? match[2] : nil

    '<iframe width="560" height="315" src="http://www.youtube.com/embed/%s" frameborder="0" allowfullscreen></iframe>' % youtube_id
  end

  def self.wufoo(node)
    username = node.attributes['username'].value
    formhash = node.attributes['formhash'].value
    autoresize = node.attributes['autoresize'].value
    height = node.attributes['height'].value
    header = node.attributes['header'].value
    ssl = node.attributes['ssl'].value

    template = <<-HTML
      <div id="wufoo-#{formhash}">
         Fill out my <a href="http://#{username}.wufoo.com/forms/#{formhash}">online form</a>.
      </div>
      <script type="text/javascript">var #{formhash};(function(d, t) {
      var s = d.createElement(t), options = {
      'userName':'#{username}',
      'formHash':'#{formhash}',
      'autoResize':#{autoresize},
      'height':'#{height}',
      'async':true,
      'header':'#{header}',
      'ssl':#{ssl}};
      s.src = ('https:' == d.location.protocol ? 'https://' : 'http://') + 'wufoo.com/scripts/embed/form.js';
      s.onload = s.onreadystatechange = function() {
      var rs = this.readyState; if (rs) if (rs != 'complete') if (rs != 'loaded') return;
      try { #{formhash} = new WufooForm();#{formhash}.initialize(options);#{formhash}.display(); } catch (e) {}};
      var scr = d.getElementsByTagName(t)[0], par = scr.parentNode; par.insertBefore(s, scr);
      })(document, 'script');</script>
    HTML

  end



  def self.shortcode(content)
    content.gsub(/\[[^\]]+\]/) do |code|
      code = Sanitize.clean(code).gsub(/^\[/, '<').gsub(/\]$/, '>')
      doc = Nokogiri::XML.parse(code)
      node = doc.root
      shortcode = node.name

      if HANDLERS[shortcode]
        send(shortcode, node)
      end
    end
  end
end
