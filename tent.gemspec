$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tent/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tent"
  s.version     = Tent::VERSION
  s.authors     = ["Hokuken Inc."]
  s.email       = ["customer@hokuken.com"]
  s.homepage    = "http://www.hokuken.com"
  s.summary     = "Tent is a web site creator within HANGO."
  s.description = "Tent is a web site creator within HANGO."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.7"

  s.add_dependency "bootstrap-sass", "~> 3.3.1"
  s.add_dependency "sass-rails", "~> 4.0.3"
  s.add_dependency "font-awesome-sass"

  s.add_dependency "jquery-rails"
  s.add_dependency "turbolinks"

  s.add_dependency "autoprefixer-rails"

  s.add_dependency 'carrierwave'

end
