require 'erb'

module Shortcodes
  class Wufoo

    def self.call(shortcode)
      new(shortcode).render
    end

    View = Struct.new(:username, :formhash, :autoresize, :height, :header, :ssl) do
      def self.new_with_attributes(attributes)
        new(*attributes.values_at(*members.map(&:to_s)))
      end
    end

    attr_reader :shortcode
    def initialize(shortcode)
      @shortcode = shortcode
    end

    def view
      erb = ERB.new(template)
      klass = erb.def_class(View)

      klass.new_with_attributes(shortcode.attributes)
    end

    def render
      view.result
    end

    def template
      <<-HTML
        <div id="wufoo-<%= formhash %>">
           Fill out my <a href="http://<%= username %>.wufoo.com/forms/<%= formhash %>">online form</a>.
        </div>
        <script type="text/javascript">var <%= formhash %>;(function(d, t) {
        var s = d.createElement(t), options = {
        'userName':'<%= username %>',
        'formHash':'<%= formhash %>',
        'autoResize':<%= autoresize %>,
        'height':'<%= height %>',
        'async':true,
        'header':'<%= header %>',
        'ssl':<%= ssl %>};
        s.src = ('https:' == d.location.protocol ? 'https://' : 'http://') + 'wufoo.com/scripts/embed/form.js';
        s.onload = s.onreadystatechange = function() {
        var rs = this.readyState; if (rs) if (rs != 'complete') if (rs != 'loaded') return;
        try { <%= formhash %> = new WufooForm();<%= formhash %>.initialize(options);<%= formhash %>.display(); } catch (e) {}};
        var scr = d.getElementsByTagName(t)[0], par = scr.parentNode; par.insertBefore(s, scr);
        })(document, 'script');</script>
      HTML
    end


    Shortcodes.register_shortcode('wufoo', self)
  end
end
