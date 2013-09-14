lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "font_awesome_tag_helper/version"
require 'date'

Gem::Specification.new do |s|
  s.name        = "font_awesome_tag_helper"
  s.version     = ExpiringAssetLinks::Version.string
  s.date        = Date.today
  
  s.summary     = "Adds Font Awesome tag helpers."
  s.description = "Adds Font Awesome tag helpers."
  s.license     = 'MIT'
  
  s.author      = "chaunce"
  s.email       = "chaunce.slc@gmail.com"
  s.homepage    = "http://github.com/chaunce/font_awesome_tag_helper"
  
  s.has_rdoc = false
  s.rdoc_options = ['--line-numbers', '--inline-source', '--main', 'README.rdoc']
  
  s.require_paths = ['lib']

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency "rails"
  s.add_dependency "font-awesome-rails"

  s.add_development_dependency "sqlite3"
end
