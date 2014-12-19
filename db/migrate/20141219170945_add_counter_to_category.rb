class AddCounterToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :projects_count, :integer
  end
end
