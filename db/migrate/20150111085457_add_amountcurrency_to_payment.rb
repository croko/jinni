class AddAmountcurrencyToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :amount_currency, :decimal, precision: 8, scale: 2, default: 0.0
    add_column :payments, :exchange_rate, :decimal, precision: 8, scale: 4, default: 1.0
  end
end
