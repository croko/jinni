class AddActiveToFoundation < ActiveRecord::Migration
  def change
    add_column :foundations, :active, :boolean
    add_column :foundations, :description, :string
  end
end
