require_dependency "tent/application_controller"

module Tent
  class SitesController < ApplicationController

    def index
      @sites = Site.all
      @site = Site.new
    end

    def new
    end

    def create
      @site = Site.new(site_params)

      if @site.save
        message = {:notice => 'イベントを追加しました'}
        redirect_to site_page_path(site_path: @site.path, page_path: '')
#        redirect_to controller: :pages, action: :show, site_path: @site.path, page_path: ''
      else
        message = {:alert => @site.errors.messages[:base]}

        @sites = Site.all
        render :index
      end
    end

    private

    def site_params
      params.require(:site).permit(:path, :title, :description,  :logo_url, :note)
    end

  end
end
