class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :phone_number
      t.string :mobile_1
      t.string :mobile_2
      t.references :city
      t.string :address_1
      t.string :address_2
      t.integer :addressable_id
      t.string :addressable_type
      t.string :email
      t.string :website_url

      t.timestamps
    end
  end
end
