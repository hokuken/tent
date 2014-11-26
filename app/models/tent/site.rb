require 'tent/reserved_words'

module Tent
  class Site < ActiveRecord::Base
    mount_uploader :logo_url, LogoUploader

    validates :title, :path, presence: true
    validates :path, length: { maximum: 50 }
    validates :path, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-z0-9_-])+\z/ }
    validates :path, exclusion: { in: Tent::ReservedWords::SITE_PATHS }
    validate  :only_one_default

    before_validation :replace_control_characters

    before_validation do
      path.downcase!
      path.strip!
    end

    after_create :insert_index_page

    has_many :pages, class_name: 'Tent::Page'

    scope :default, -> { where(default: true) }

    private

    def insert_index_page
      Page.create site_id: id, path: :index
    end

    def replace_control_characters
      path.gsub! /[[:cntrl:]]/, " "
    end

    def only_one_default
      return unless default?

      default_site = Site.default
      if persisted?
        default_site = default_site.where.not(id: id)
      end
      if default_site.exists?
        errors.add(:default, 'cannot have another default site')
      end


    end

  end
end
