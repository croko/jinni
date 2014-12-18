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
        field :category
        field :title
        field :goal
        field :about
        field :user
        field :foundation
        field :payment_system
        field :date_start
        field :date_end
        field :amount
        field :location
        field :featured
        field :published
        field :approved
        field :status, :enum do
          enum do
           ['open','close']
          end
          # visible false
        end
        field :photos


      end

    end
  end

end