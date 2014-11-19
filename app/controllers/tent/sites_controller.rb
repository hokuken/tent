require_dependency "tent/application_controller"

module Tent
  class SitesController < ApplicationController
    def index
      @sites = Site.all
      @site = Site.new
      @host_url = main_app.root_url
    end

    def new
    end

    def create
    end
  end
end
