require_dependency "tent/application_controller"

module Tent
  class Admin::PagesController < ApplicationController

    def index
      site_name = params[:site_name]
    end


    def edit
      raise 'tent::pages#edit'
    end
  end
end
