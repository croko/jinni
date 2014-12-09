class AddWithfondToUser < ActiveRecord::Migration
  def change
    add_column :users, :with_foundation, :boolean, default: false
  end
end
