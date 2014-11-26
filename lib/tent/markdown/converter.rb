require 'html/pipeline'

module Tent
  module Markdown
    class Converter
      def call(input)
        pipeline = HTML::Pipeline.new [
          Tent::Markdown::Filters::Redcarpet,
          Tent::Markdown::Filters::Tent
        ]

        result = pipeline.call(input)
      end
    end
  end
end
