require 'spec_helper'

# Acceptance tests
describe Shortcodes do
  it 'is a module (sanity check)' do
    Shortcodes.should be_kind_of(Module)
  end


  context 'with an unrecognized shortcode' do
    # TODO: I'm not sure that removing unrecognized shortcodes is the best behaviour.
    #   Should we leave it in place? Insert an HTML comment? This also brings up the question:
    #   do we need the original shortcode to be provided to handlers?
    it 'removes the shortcode' do
      content = '[omgomgnotashortcode]'
      Shortcodes.shortcode(content).should == ''
    end

    it 'keeps other content' do
      content = 'some stuff [omgomgnotashortcode] other stuff'
      Shortcodes.shortcode(content).should == 'some stuff  other stuff'
    end
  end

  it 'replaces a youtube shortcode' do
    content = '[youtube url="https://www.youtube.com/watch?v=jyOSP36sHx0"]'
    expected_content = '<iframe width="560" height="315" src="http://www.youtube.com/embed/jyOSP36sHx0" frameborder="0" allowfullscreen></iframe>'

    Shortcodes.shortcode(content).should == expected_content
  end

end
