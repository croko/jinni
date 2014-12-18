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

      # edit do
      #   field :main_images, :carrierwave
      # end

    end
  end

end