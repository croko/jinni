class RemoveMainImageFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :main_image, :string
  end
end
