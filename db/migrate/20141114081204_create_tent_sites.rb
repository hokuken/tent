class CreateTentSites < ActiveRecord::Migration
  def change
    create_table :tent_sites do |t|
      t.string  :path, null: false
      t.string  :title
      t.text    :note
      t.text    :description
      t.string  :logo_url
      t.integer :theme_id

      t.timestamps

      t.index :path, unique: true
    end
  end
end
