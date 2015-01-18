module AdminFoundation
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        sort_by :name
        field :id
        field :name
        field :active do
          column_width 15
        end
        field :featured do
          column_width 15
        end
      end

      edit do
        field :name do
          html_attributes do
            {style: "width:80%"}
          end
        end
        field :description, :wysihtml5 do
          config_options locale: "ru-RU",
                         toolbar: {
                             fa: true,
                             html: true
                         }
        end
        field :active
        field :featured
        field :website_url do
          html_attributes do
            {style: "width:80%"}
          end
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
        field :logo

      end
      exclude_fields :created_at, :updated_at
    end
  end
end