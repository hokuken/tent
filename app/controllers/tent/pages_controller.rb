require_dependency "tent/application_controller"
require "html/pipeline"
require "tent/markdown"

module Tent
  class PagesController < ApplicationController
    def show
      site_path = params.fetch :site_path
      page_path = params.fetch :page_path, :index

      site = Site.where(path: site_path).first
      page = Page.where(site_id: site.id, path: page_path).first

      unless page
        raise "#{site_path}/#{page_path} not found"
      end

      page.body = '##あいうえお

tent

tentですね。
'
      @body = convert_body page.body

    end

    private

    def convert_body(body)
      pipeline = HTML::Pipeline.new [
        Tent::Markdown::Filters::Redcarpet,
        Tent::Markdown::Filters::Tent
      ]

      result = pipeline.call(body)
      result[:output].to_s

    end



  end
end
