class RemoveMainImagesFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :main_images, :json
  end
end
