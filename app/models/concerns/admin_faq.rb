module AdminFaq
  extend ActiveSupport::Concern

  included do
    rails_admin do

      list do
        field :title
        field :published
      end

      edit do
        field :title do
          html_attributes do
            {style: "width:60%"}
          end
        end
        field :body, :wysihtml5 do
          config_options locale: "ru-RU",
                         toolbar: {
                             fa: true,
                             html: true
                         }
        end
        field :published
      end
    end
  end
end
