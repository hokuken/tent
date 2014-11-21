module Tent
  class Site < ActiveRecord::Base
    mount_uploader :logo_url, LogoUploader

    validates :title, :path, presence: true
    validates :path, length: { maximum: 50 }
    validates :path, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-z0-9_-])+\z/ }
    validates :path, exclusion: { in: Tent::Site::RESERVED_PATHS }

    before_validation :replace_control_characters

    before_validation do
      path.downcase!
      path.strip!
    end

    after_create :insert_index_page

    private

    def insert_index_page
      Page.create site_id: id, path: :index
    end

    def replace_control_characters
      path.gsub! /[[:cntrl:]]/, " "
    end


  end
end
