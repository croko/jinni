class CreateFoundations < ActiveRecord::Migration
  def change
    create_table :foundations do |t|
      t.string :name

      t.timestamps
    end
  end
end
