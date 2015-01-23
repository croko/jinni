class AddFixedpriceToProject < ActiveRecord::Migration
  def change
    add_column :projects, :fixed_price, :boolean, default: false
  end
end
