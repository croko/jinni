module AdminUser
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :fio
        field :email
        field :created_at do
          formatted_value { I18n.l bindings[:object].created_at }
        end

      end

      edit do
        field :email
        field :first_name do
          html_attributes do
            {style: "width:80%"}
          end
        end
        field :last_name do
          html_attributes do
            {style: "width:80%"}
          end
        end
        field :publish
        field :about, :wysihtml5 do
          config_options locale: "ru-RU",
                         toolbar: {
                             fa: true,
                             html: true
                         }
        end
        field :twitter_url do
          html_attributes do
            {style: "width:80%"}
          end
        end
        field :facebook_url do
          html_attributes do
            {style: "width:80%"}
          end
        end
        field :google_url do
          html_attributes do
            {style: "width:80%"}
          end
        end
        field :with_foundation
        field :image
        field :addresses
        field :payment_systems
        field :projects
        field :finished_projects
        field :authentications
        field :admin
      end

      exclude_fields :created_at, :updated_at, :crypted_password, :salt, :remember_me_token, :remember_me_token_expires_at,
                     :reset_password_token, :reset_password_token_expires_at, :reset_password_email_sent_at
    end
  end

end