module Tent
  class Site < ActiveRecord::Base
    mount_uploader :logo_url, LogoUploader

  end
end
