class CreateTentPages < ActiveRecord::Migration
  def change
    create_table :tent_pages do |t|
      t.string :path
      t.string :title
      t.text :description
      t.text :keywords
      t.text :javascript
      t.text :head
      t.text :body
      t.string :template_name
      t.string :menu_page_id
      t.string :footer_page_id
      t.integer :published
      t.integer :indexed

      t.timestamps
    end
  end
end
