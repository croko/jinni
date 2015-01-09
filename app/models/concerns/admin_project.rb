module AdminProject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :title
        field :user do
          searchable :last_name
        end
        field :category do
          searchable :name
        end
        field :date_start do
          formatted_value { I18n.l bindings[:object].date_start }
        end
        field :date_end do
          formatted_value { I18n.l bindings[:object].date_end }
        end
        field :amount
        field :status
        field :approved
        field :published
      end

      edit do
        field :category
        field :title do
          html_attributes do
            {style: "width:60%"}
          end
        end
        field :goal do
          html_attributes do
            {style: "width:80%"}
          end
        end
        field :about, :wysihtml5 do
          config_options locale: "ru-RU",
                         toolbar: {
                             fa: true,
                             html: true
                         }
        end
        field :user
        field :foundation
        field :payment_system
        field :date_start
        field :date_end
        field :amount
        field :tag_list do
          html_attributes do
            {style: "width:60%"}
          end

          def form_value
            bindings[:object].tag_list.join(', ')
          end
        end
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
        field :reports

      end
      exclude_fields :slug, :project_id
    end
  end

end