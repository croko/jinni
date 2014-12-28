class AddCounterToProject < ActiveRecord::Migration
  def change
    add_column :projects, :payments_count, :integer
  end
end
