class ChangeDefaultPaymentSystems < ActiveRecord::Migration
  def change
    change_column :payment_systems, :active, :boolean, default: true
  end
end
