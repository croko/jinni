module AdminProject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
            field :id
            field :title
            field :user do
              searchable :first_name
            end
            field :category do
              searchable :name
            end
            field :date_start do
              date_format :default
            end
            field :date_end do
              date_format :default
            end
            field :amount
            field :status
            field :approved
       end

      edit do
        field :main_images, :carrierwave
      end

      # exclude_fields :created_at, :updated_at, :crypted_password, :salt, :remember_me_token, :remember_me_token_expires_at,
      #                :reset_password_token, :reset_password_token_expires_at, :reset_password_email_sent_at
    end
  end

end