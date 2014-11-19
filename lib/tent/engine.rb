require 'font-awesome-sass'
require "jquery-rails"
require "bootstrap-sass"
require "turbolinks"

module Tent
  class Engine < ::Rails::Engine
    isolate_namespace Tent

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

  end
end
