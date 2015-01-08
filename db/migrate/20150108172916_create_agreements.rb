class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end
