class CreateTentThemes < ActiveRecord::Migration
  def change
    create_table :tent_themes do |t|
      t.string :name
      t.string :thumbnail_url
      t.string :repository_url

      t.timestamps

      t.index :name, unique: true
    end
  end
end
