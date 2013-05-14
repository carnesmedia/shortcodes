require 'spec_helper'

describe Shortcodes::Parser do
  context 'with a few stub shortcodes' do
    before do
      Shortcodes::Parser.handlers['omg'] = ->(shortcode) {
        count = shortcode.attributes.fetch('count', 3)
        (["OMG"] * count.to_i).join(' ')
      }
    end

    after do
      Shortcodes::Parser.handlers.delete('omg')
    end

    it 'parses more than one shortcode' do
      content = '[omg count="4"] and [omg]'
      expected_content = 'OMG OMG OMG OMG and OMG OMG OMG'

      Shortcodes::Parser.new(content).to_html.should == expected_content
    end

    it 'leaves other content' do
      content = 'Some content [omg] other content'
      expected_content = 'Some content OMG OMG OMG other content'

      Shortcodes::Parser.new(content).to_html.should == expected_content
    end
  end

  it 'handles possible wysiwyg confusion' do
    content = '[youtube url="<a href="https://www.youtube.com/watch?v=jyOSP36sHx0">https://www.youtube.com/watch?v=jyOSP36sHx0</a>"]'
    expected_content = '<iframe width="560" height="315" src="http://www.youtube.com/embed/jyOSP36sHx0" frameborder="0" allowfullscreen></iframe>'

    Shortcodes.shortcode(content).should == expected_content
  end
end
