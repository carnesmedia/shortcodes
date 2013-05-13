require 'spec_helper'

describe Shortcodes::Youtube do
  let(:shortcode) { OpenStruct.new(code: 'youtube', attributes: attributes) }

  context 'a basic example' do
    let(:attributes) { { 'url' => 'http://www.youtube.com/watch?v=jyOSP36sHx0' } }

    it 'generates a youtube embed code' do
      expected_content = '<iframe width="560" height="315" src="http://www.youtube.com/embed/jyOSP36sHx0" frameborder="0" allowfullscreen></iframe>'

      Shortcodes::Youtube.call(shortcode).should == expected_content
    end
  end
end
