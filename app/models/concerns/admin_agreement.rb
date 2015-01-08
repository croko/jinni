module AdminAgreement
  extend ActiveSupport::Concern

  included do
    rails_admin do

      edit do
        field :body do
          label false
          html_attributes do
            {style: "width:100%", rows: '60'}
          end
        end
      end

    end
  end
end
