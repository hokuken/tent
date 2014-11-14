class CreateTentPages < ActiveRecord::Migration
  def change
    create_table :tent_pages do |t|
      t.string  :path,           null: false
      t.string  :title
      t.text    :description
      t.text    :keywords
      t.text    :javascript
      t.text    :head
      t.text    :body,           null: false, default: ''
      t.string  :template_name
      t.integer :menu_page_id
      t.integer :footer_page_id
      t.integer :published
      t.integer :indexed

      t.timestamps

      t.index :path, unique: true
    end
  end
end
