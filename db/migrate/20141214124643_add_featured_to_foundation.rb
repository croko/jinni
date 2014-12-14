class AddFeaturedToFoundation < ActiveRecord::Migration
  def change
    add_column :foundations, :featured, :boolean, default: false
  end
end
