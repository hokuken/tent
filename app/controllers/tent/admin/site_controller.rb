require_dependency "tent/application_controller"

module Tent
  class Admin::SiteController < ApplicationController
    before_filter :set_site

    def dashboard
      raise 'does not work dashboard'
    end

    def configure
      # show site settings
    end

    def configure_update
      if @site.update site_params
         flash[:success] = ['サイト情報の更新をしました']
         redirect_to admin_pitch_path(site_path: @site.path)
      else
        flash[:error] = @site.errors.full_messages

        render :configure
      end
    end

    private

    def set_site
      path = params.fetch :site_path, ''
      @site = Site.where(path: path).first
      unless @site
        raise "#{path} not found"
      end
    end

    def site_params
      params.require(:site).permit(:path, :title, :description, :logo_url, :default, :logo_url_cache, :remove_logo_url)
    end

  end
end
