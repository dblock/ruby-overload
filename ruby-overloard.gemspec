# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'ruby-overload/version'

Gem::Specification.new do |s|
  s.name = 'ruby-overload'
  s.version = Ruby::Overload::VERSION
  s.authors = ['Luca Guidi', 'Daniel Doubrovkine']
  s.email = 'dblock@dblock.org'
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'
  s.required_rubygems_version = '>= 1.3.6'
  s.files = Dir['**/*']
  s.require_paths = ['lib']
  s.homepage = 'http://github.com/dblock/ruby-overload'
  s.licenses = ['MIT']
  s.summary = 'Method overload behavior for Ruby.'
end
