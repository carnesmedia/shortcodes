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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
