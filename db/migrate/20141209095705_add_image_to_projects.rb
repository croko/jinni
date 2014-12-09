class AddImageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :main_image, :string
  end
end
