# Shortcodes

Wordpress style shortcodes for your Ruby CMS.

A simple ruby gem that will parse your cms content for wordpress style shortcodes.

## Installation

Add this line to your application's Gemfile:

    gem 'shortcodes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shortcodes

## Usage

### Rails

In your helpers:

```ruby
module ApplicationHelper
  include Shortcodes

  def wysiwyg_content(content)
    shortcodes(content)
  end
end
```

### Otherwise

```ruby
def wysiwyg_content(content)
  Shortcodes.shortcodes(content)
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
