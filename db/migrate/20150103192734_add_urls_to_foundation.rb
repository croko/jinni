class AddUrlsToFoundation < ActiveRecord::Migration
  def change
    add_column :foundations, :logo, :string
    add_column :foundations, :website_url, :string
    add_column :foundations, :twitter_url, :string
    add_column :foundations, :facebook_url, :string
    add_column :foundations, :google_url, :string
  end
end
