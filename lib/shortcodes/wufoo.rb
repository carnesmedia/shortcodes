module Shortcodes
  class Wufoo

    def self.call(shortcode)
      attributes = shortcode.attributes

      username = attributes['username']
      formhash = attributes['formhash']
      autoresize = attributes['autoresize']
      height = attributes['height']
      header = attributes['header']
      ssl = attributes['ssl']

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
  end
end
