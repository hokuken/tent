module Tent
  class Site < ActiveRecord::Base
    mount_uploader :logo_url, LogoUploader

    before_validation { path.downcase! }
    after_create :insert_index_page

    private

    def insert_index_page
      Page.create site_id: id, path: :index
    end
  end
end
