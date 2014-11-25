require 'tent'

module Tent
  module Markdown
    module Filters
      class Tent < HTML::Pipeline::Filter
        
        def call
          doc.search("p").each do |p|
            if p.content == 'tent'
              p.name = "pre"
              p.content = <<-'EOD'
          /~
         / \
        / _ \
       / ||| \
   ^^^/^^^^^^^\^^^   
              EOD
            end
          end
          doc
        end
      end
    end
  end
end
  