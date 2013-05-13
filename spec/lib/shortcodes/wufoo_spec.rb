require 'spec_helper'

describe Shortcodes::Wufoo do
  let(:shortcode) { OpenStruct.new(code: 'youtube', attributes: attributes) }

  let(:attributes) { {
    'username' => "awesome_user",
    'formhash' => "a04909c",
    'autoresize' => "true",
    'height' => "961",
    'header' => "show",
    'ssl' => "true",
  } }

  # TODO: We should really be parsing html and verifying attributes instead of comparing strings.
  def strip_whitespace(string)
    string.to_s.gsub(/\s+/, ' ')
  end

  it 'replaces a wufoo shortcode' do
    expected_content = <<-HTML
      <div id="wufoo-a04909c">
         Fill out my <a href="http://awesome_user.wufoo.com/forms/a04909c">online form</a>.
      </div>
      <script type="text/javascript">var a04909c;(function(d, t) {
      var s = d.createElement(t), options = {
      'userName':'awesome_user',
      'formHash':'a04909c',
      'autoResize':true,
      'height':'961',
      'async':true,
      'header':'show',
      'ssl':true};
      s.src = ('https:' == d.location.protocol ? 'https://' : 'http://') + 'wufoo.com/scripts/embed/form.js';
      s.onload = s.onreadystatechange = function() {
      var rs = this.readyState; if (rs) if (rs != 'complete') if (rs != 'loaded') return;
      try { a04909c = new WufooForm();a04909c.initialize(options);a04909c.display(); } catch (e) {}};
      var scr = d.getElementsByTagName(t)[0], par = scr.parentNode; par.insertBefore(s, scr);
      })(document, 'script');</script>
    HTML

    strip_whitespace(Shortcodes::Wufoo.call(shortcode)).should == strip_whitespace(expected_content)
  end
end
