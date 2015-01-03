class AddUrlToFoundation < ActiveRecord::Migration
  def change
    begin
    add_column :foundations, :logo, :string
    add_column :foundations, :website_url, :string
    add_column :foundations, :twitter_url, :string
    add_column :foundations, :facebook_url, :string
    add_column :foundations, :google_url, :string
    rescue
       puts "ninefold error"
    end
  end
end
