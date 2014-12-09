class AddImagesToProject < ActiveRecord::Migration
  def change
    add_column :projects, :main_images, :json
  end
end
