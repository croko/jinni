class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :project, index: true
      t.string :main_image

      t.timestamps
    end
  end
end
