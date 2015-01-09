module AdminReport
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :project do
          searchable :title
        end
        field :goal
      end

      edit do
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
        field :project
        field :photos

      end
      exclude_fields :slug, :project_id
    end
  end

end