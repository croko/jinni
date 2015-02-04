class AddSharedToReport < ActiveRecord::Migration
  def change
    add_column :reports, :shared, :boolean, default: false
  end
end
