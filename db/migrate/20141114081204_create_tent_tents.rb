class CreateTentTents < ActiveRecord::Migration
  def change
    create_table :tent_tents do |t|
      t.string :title
      t.text :note
      t.text :description
      t.string :logo_url
      t.integer :theme_id

      t.timestamps
    end
  end
end
