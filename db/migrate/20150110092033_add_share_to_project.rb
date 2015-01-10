class AddShareToProject < ActiveRecord::Migration
  def change
    add_column :projects, :share, :boolean, default: true
    add_column :projects, :shared, :boolean, default: false
  end
end
