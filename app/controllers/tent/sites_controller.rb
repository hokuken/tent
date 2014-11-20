require_dependency "tent/application_controller"

module Tent
  class SitesController < ApplicationController

    def index
      @sites = Site.all
    end

    def new
      @site = Site.new
    end

    def create
      @site = Site.new(site_params)

      if @site.save
        flash[:success]  = 'サイトを追加しました'
        redirect_to site_page_path(site_path: @site.path, page_path: '')
      else
        flash[:error] = @site.errors.full_messages

        @sites = Site.all
        render :new
      end
    end

    private

    def site_params
      params.require(:site).permit(:path, :title, :description,  :logo_url, :note)
    end

  end
end
