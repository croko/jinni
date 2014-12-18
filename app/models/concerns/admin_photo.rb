module AdminPhoto
  extend ActiveSupport::Concern

  included do
    rails_admin do

      exclude_fields :created_at, :updated_at, :project_id
    end
  end
end