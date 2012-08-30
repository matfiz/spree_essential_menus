#encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "spree_essential_menus/version"
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_essential_menus'
  s.version     = SpreeEssentialMenus::VERSION
  s.summary     = 'Add menu customization for Spree'
  s.description = "Add menu customization for Spree. It's designed to be used with the spree_essentials base."
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Grzegorz Brzezinka'
  s.email     = 'grzegorz@brzezinka.eu'
  s.homepage  = 'http://www.brzezinka.eu'
  s.has_rdoc = false

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib','lib/paperclip_processors']
  s.requirements << 'none'

  # Spree Essentials
  s.add_runtime_dependency('spree_essentials', '~> 0.5.0')
  s.add_runtime_dependency('coffee-rails')
  s.add_runtime_dependency('acts_as_tree', '~> 1.1.0')
  
  s.add_runtime_dependency('haml')

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
end
