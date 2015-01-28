class AddPublishedToUser < ActiveRecord::Migration
  def change
    add_column :users, :publish, :boolean, default: true
  end
end
