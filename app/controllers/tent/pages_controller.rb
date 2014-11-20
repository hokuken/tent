require_dependency "tent/application_controller"

module Tent
  class PagesController < ApplicationController
    def show
      site_name = params.fetch :site_path
      page_path = params.fetch :page_path, :index
      raise "#{site_name} : #{page_path}"
    end

    def tent
      raise "how are you"
    end
  end
end
