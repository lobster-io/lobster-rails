# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lobster/version'

Gem::Specification.new do |s|
  s.name          = 'lobster-rails'
  s.version       = Lobster::VERSION
  s.summary       = 'A friendly way for users to use the lobster form API in rails apps.'
  s.description   = 'Allows the user to easily insert a Lobster Form into a web page.'
  s.authors       = ["Patrick O'Donnell"]
  s.email         = 'patrick@lobster.io'
  s.homepage      = 'https://github.com/lobsterio/lobster-rails'
  s.license       = 'MIT'
  s.files         = ['lib/lobster/rails.rb', 'lib/lobster/version.rb', 'lib/lobster/railtie.rb', 'lib/lobster/lobster_helper.rb']
  s.require_paths = ['lib']
end