class ChangeDescriptionInFoundation < ActiveRecord::Migration
  def change
    change_column :foundations, :description, :text
  end
end
