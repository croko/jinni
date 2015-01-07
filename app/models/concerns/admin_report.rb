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
        field :about do
          html_attributes do
            {style: "width:90%", rows: '7'}
          end
        end
        field :project
        field :photos

      end
      exclude_fields :slug, :project_id
    end
  end

end