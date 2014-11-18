class CreateTentSites < ActiveRecord::Migration
  def change
    create_table :tent_sites do |t|

      ##########################################
      # When include Tent to Project Based App,
      # reveal below line
      ##########################################

      # t.integer :project_id

      # Site path
      t.string  :path, null: false

      # Site meta data
      t.string  :title
      t.text    :description
      t.string  :logo_url
      t.integer :theme_id

      # Site meta data for admin
      t.text    :note

      t.timestamps

      t.index :path, unique: true
    end
  end
end
