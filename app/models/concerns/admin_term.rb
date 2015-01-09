module AdminTerm
  extend ActiveSupport::Concern

  included do
    rails_admin do

      edit do
        field :body, :wysihtml5 do
          config_options locale: "ru-RU",
                                 toolbar: {
                                     fa: true,
                                     html: true
                                 }
          label false
        end
      end

    end
  end
end
