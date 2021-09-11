# frozen_string_literal: true

Gem::Specification.new do |s|
  s.required_ruby_version = '~> 3.0'
  s.name = 'kate'
  s.version     = '0.0.1'
  s.summary     = 'Kubernetes SDK'
  s.description = 'Ruby wrapper on top of kubectl'
  s.authors     = ['Jarrod Folino']
  s.email       = 'jarrod.folino@icloud.com'
  s.files       = ['lib/kate.rb']
  s.homepage    =
    'https://rubygems.org/gems/hola'
  s.license = 'MIT'

  s.add_dependency('json', '2.5.1')
  s.add_dependency('open3', '0.1.1')
end
