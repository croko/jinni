class AddAccesstokenToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :access_token, :string
  end
end
