module AdminCategory
  extend ActiveSupport::Concern

  included do
    rails_admin do
      exclude_fields :slug, :projects_count
    end
  end
end