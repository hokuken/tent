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
        else
          raise "/#{path} not found"
        end
      else
        if page_path.size == 0
          page_path = "index"
        end

        @page = Page.where(site_id: @site.id, path: page_path).first
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
