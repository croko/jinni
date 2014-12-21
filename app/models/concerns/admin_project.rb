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
        field :category do
          associated_collection_cache_all false
          associated_collection_scope do
            Proc.new { |scope|
              scope.order(:name)
            }
          end
        end
        field :title
        field :goal
        field :about
        field :user
        field :foundation
        field :payment_system
        field :date_start
        field :date_end
        field :amount
        field :tag_list
        field :location
        field :featured
        field :published
        field :approved
        field :status, :enum do

          enum do
            Project.statuses.map { |k, _| [k.titleize, k] }
          end

          pretty_value do
            bindings[:object].send(:status).titleize
          end

          def form_value
            bindings[:object].status
          end
        end

        field :photos
      end
      exclude_fields :slug

    end
  end

end