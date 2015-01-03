module AdminFoundation
  extend ActiveSupport::Concern

  included do
    rails_admin do
      exclude_fields :created_at, :updated_at
    end
  end

end