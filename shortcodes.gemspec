# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shortcodes/version'

Gem::Specification.new do |spec|
  spec.name          = "shortcodes"
  spec.version       = Shortcodes::VERSION
  spec.authors       = ["Amiel Martin"]
  spec.email         = ["amiel@carnesmedia.com"]
  spec.description   = %q{Wordpress style shortcodes for your Ruby CMS}
  spec.summary       = %q{Shortcodes is a simple ruby gem that will parse your cms content for wordpress style shortcodes.}
  spec.homepage      = "https://github.com/carnesmedia/shortcodes"
  spec.license       = "MIT"

  spec.files = Dir["lib/**/*"] + ["LICENSE.txt", "Rakefile", "README.md"]
  # spec.test_files = Dir["spec/**/*"]

  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
