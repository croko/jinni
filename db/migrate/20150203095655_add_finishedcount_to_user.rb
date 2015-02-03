class AddFinishedcountToUser < ActiveRecord::Migration
  def change
    add_column :users, :finished_projects_count, :integer, default: 0
  end
end
