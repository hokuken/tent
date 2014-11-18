class CreateTentPages < ActiveRecord::Migration
  def change
    create_table :tent_pages do |t|
      t.integer :site_id,        null: false
      # Page path: Default page is 'index'
      t.string  :path,           null: false

      # Meta data
      t.string  :title
      t.text    :description
      t.text    :keywords

      # Custom Javascript and Head section
      t.text    :javascript
      t.text    :head

      # Body data and body parser
      t.text    :body,           null: false, default: ''
      t.string  :parser,         null: false, default: 'markdown'

      # Template file name
      t.string  :template_name

      # Parent page id
      t.integer :parent_id

      t.integer :nav_page_id
      t.integer :menu_page_id
      t.integer :footer_page_id

      # Published to guests
      t.integer :published

      # Show on sitemap and Be crawlable
      t.integer :indexed

      t.timestamps

      t.index [:site_id, :path], unique: true
    end
  end
end
