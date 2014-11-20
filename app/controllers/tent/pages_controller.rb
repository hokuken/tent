require_dependency "tent/application_controller"

module Tent
  class PagesController < ApplicationController
    def show
      site_path = params.fetch :site_path
      page_path = params.fetch :page_path, :index

      site = Site.where(path: site_path).first
      page = Page.where(site_id: site.id, path: page_path).first
      if page
        raise "#{site_path}/#{page_path} found"
      else
        raise "#{site_path}/#{page_path} not found"
      end
    end
  end
end
