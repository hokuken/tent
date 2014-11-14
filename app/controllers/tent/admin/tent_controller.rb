require_dependency "tent/application_controller"

module Tent
  class Admin::TentController < ApplicationController
    def dashboard
      raise 'does not work dashboard'
    end

    def configure
      raise 'does not work configuration'
    end
  end
end
