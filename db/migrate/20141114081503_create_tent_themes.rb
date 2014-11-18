class CreateTentThemes < ActiveRecord::Migration
  def change
    create_table :tent_themes do |t|

      # Theme name [a-z][a-z0-9_-]{2,}
      t.string :name

      # Thumbnail Image URL
      t.string :thumbnail_url
      # Repository URL
      t.string :repository_url

      ############################
      # When include Tent to App,
      # reveal below line
      ############################

      # t.integer :user_id, null: false

      t.timestamps

      ############################
      # When include Tent to App,
      # switch below comment
      ############################
      t.index  :name, unique: true
      # t.index [:user_id, :name], unique: true
    end
  end
end
