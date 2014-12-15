class AddPublishedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :published, :boolean, default: false
    add_column :projects, :approved, :boolean, default: false
  end
end
