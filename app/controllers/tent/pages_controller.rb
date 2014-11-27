require_dependency "tent/application_controller"
require "tent/markdown"

module Tent
  class PagesController < ApplicationController
    def show
      path = params.fetch :path, ''
      page_path = ''

      if path.length == 0
        @site = Site.default.first
      else
        site_path, partition, page_path = path.partition('/')
        @site = Site.where(path: site_path).first
      end

      unless @site
        @page = Site.default.first.pages.where(path: path).first
        if @page
          @site = @page.site
          page_path = @page.path
          site_path = ''
        else
          raise "/#{path} not found"
        end
      else
        @page = Page.where(site_id: @site.id, path: page_path.size == 0 ? 'index' : page_path).first
      end

      if @site.default?
        unless path.size == 0 || site_path.size == 0
          redirect_to site_page_path(path: page_path)
          return
        end
      end
      
      if page_path == 'index'
        redirect_to site_page_path(path: @site.default? ? '' : @site.path)
        return
      end

      unless @page
        raise "/#{path} not found"
      end

      @page.body = '##あいうえお

tent

tentですね。
'
      @body_html = convert_body @page.body

    end

    private

    def convert_body(body)
      result = Tent::Markdown::Converter.new.call body
      result[:output].to_s
    end
  end
end
