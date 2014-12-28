class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :project, index: true
      t.references :payment_gateway, index: true
      t.string :sender_phone
      t.string :payment_transaction
      t.string :payment_status
      t.string :payment_type
      t.string :liqpay_order_id
      t.decimal :commission, precision: 8, scale: 2, default: 0.0
      t.string :currency
      t.decimal :amount, precision: 8, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
