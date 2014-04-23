# Shortcodes

Wordpress style shortcodes for your Ruby CMS.

A simple ruby gem that will parse your cms content for wordpress style shortcodes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shortcodes'
```

Then require the shortcodes you intend on using.

To automatically load all built-in shortcodes use:

```ruby
# Gemfile
gem 'shortcodes', require: 'shortcodes/all'
```

To only load specified shortcodes do not use `require: 'shortcodes/all'`, and
instead require only the shortcodes you intend to use. In rails, you can do this
in an initialize like so:

```ruby
# config/initializers/shortcodes.rb
require 'shortcodes/youtube'
```

## Usage

```ruby
Shortcodes.shortcode(content)
```

## Built-in Shortcodes

### Youtube

Example:

```
[youtube url="https://www.youtube.com/watch?v=Gzj723LkRJY#t=3m21s"]
```

Attributes:

* `url` - required
* `width`, `height` - optional. defaults to 560x315

### Wufoo

Copying and pasting the Wufoo Wordpress shortcode should work.

Example:

```
[wufoo username="awesome_user" formhash="a04909c" autoresize="true" height="961" header="show" ssl="true"]
```

### Custom shortcodes

Either create an object that responds to `call`, or subclass `Shortcodes::Handler` and implement
`render`. Register the shortcode using `Shortcodes.register\_shortcode`. Example:

```ruby
require 'shortcodes/handler'

class MyShortcode < Shortcodes::Handler
  def render
    "Attributes can be accessed with <tt>#attributes</tt>: <pre>#{attributes.inspect}</pre>"
  end
end

Shortcodes.register_shortcode('my-shortcode', MyShortcode)
```

Also see
[lib/shortcodes/youtube.rb](https://github.com/carnesmedia/shortcodes/blob/master/lib/shortcodes/youtube.rb)
for a good real-world example.

#### Please PR new shortcodes!

If you write a custom that might be useful to other people, please submit
a pull-request!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
