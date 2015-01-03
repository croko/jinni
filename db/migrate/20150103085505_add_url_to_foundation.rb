class AddUrlToFoundation < ActiveRecord::Migration
  def change
    remove_column :foundations, :website_url, :string
  end
end
