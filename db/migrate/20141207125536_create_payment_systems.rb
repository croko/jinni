class CreatePaymentSystems < ActiveRecord::Migration
  def change
    create_table :payment_systems do |t|
      t.string :name
      t.references :foundation, index: true
      t.references :user, index: true
      t.references :payment_gateway, index: true
      t.string :public_key
      t.string :private_key
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
