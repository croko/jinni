class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :goal
      t.text :about
      t.references :user, index: true
      t.references :foundation, index: true
      t.references :payment_system, index: true
      t.integer :status
      t.date :date_start
      t.date :date_end
      t.references :category, index: true
      t.decimal :amount, precision: 8, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
