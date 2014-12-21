class AddCollectedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :collected, :decimal, precision: 8, scale: 2, default: 0.0
  end
end
