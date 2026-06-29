require_relative 'lib/opentui/version'

Gem::Specification.new do |spec|
  spec.name     = 'opentui'
  spec.version  = OpenTUI::VERSION
  spec.licenses = ['BSD-1-Clause']
  spec.homepage = 'https://opentui.com'
  spec.summary  = 'Ruby bindings for OpenTUI'
  spec.author   = 'oneureka'
  spec.email    = 'oneureka@github.io'
  spec.files    = Dir['lib/**/*.rb']

  spec.executable = 'opentui'
  spec.required_ruby_version = '>= 3.0'
end
