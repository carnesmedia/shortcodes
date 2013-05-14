require 'spec_helper'

# Acceptance tests
describe Shortcodes do
  it 'is a module (sanity check)' do
    Shortcodes.should be_kind_of(Module)
  end

  context 'with an unrecognized shortcode' do
    it 'removes the shortcode' do
      content = '[omgomgnotashortcode]'
      expected_content = '<!-- Shortcodes: unknown shortcode [omgomgnotashortcode] -->'

      Shortcodes.shortcode(content).should == expected_content
    end

    it 'keeps other content' do
      content = 'some stuff [omgomgnotashortcode] other stuff'
      expected_content = 'some stuff <!-- Shortcodes: unknown shortcode [omgomgnotashortcode] --> other stuff'
      Shortcodes.shortcode(content).should == expected_content
    end

  end

  it 'replaces a youtube shortcode' do
    content = '[youtube url="https://www.youtube.com/watch?v=jyOSP36sHx0"]'
    expected_content = '<iframe width="560" height="315" src="http://www.youtube.com/embed/jyOSP36sHx0" frameborder="0" allowfullscreen></iframe>'

    Shortcodes.shortcode(content).should == expected_content
  end

end
