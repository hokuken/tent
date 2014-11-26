class AddColumnToTentSite < ActiveRecord::Migration
  def change
    add_column :tent_sites, :default, :boolean, null: false, default: false
  end
end
