require_dependency "tent/application_controller"

module Tent
  class PagesController < ApplicationController
    def show
      site_name = params[:site_name]
      page_path = params[:page_path]
      raise "#{site_name} : #{page_path}"
    end

    def tent
      raise "how are you"
    end
  end
end
