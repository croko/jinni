module AdminUser
  extend ActiveSupport::Concern

  included do
    rails_admin do
      exclude_fields :created_at, :updated_at, :crypted_password, :salt, :remember_me_token, :remember_me_token_expires_at,
                     :reset_password_token, :reset_password_token_expires_at, :reset_password_email_sent_at
    end
  end

end