class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :project, index: true
      t.string :goal
      t.text :about
      t.string :slug

      t.timestamps
    end
  end
end
