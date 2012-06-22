$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "font_awesome_tag_helper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "font_awesome_tag_helper"
  s.version     = FontAwesomeTagHelper::VERSION
  s.authors     = ["chaunce"]
  s.email       = ["chaunce.slc@gmail.com"]
  s.homepage    = ""
  s.summary     = "Adds Font Awesome tag helpers."
  s.description = "Adds Font Awesome tag helpers."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
end
