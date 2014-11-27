module Tent
  class Page < ActiveRecord::Base

    belongs_to :site, class_name: 'Tent::Site'

    def to_param
      path
    end
  end
end
