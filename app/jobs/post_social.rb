class PostSocial < ActiveJob::Base
  queue_as :default

  def perform(project, token, provider)
    if provider == 'facebook'
      @api = Koala::Facebook::API.new(token)
      @api.put_wall_post('На https://jinni.com.ua размещен новый проект!',
                         {
                             name: project.title,
                             link: Rails.application.routes.url_helpers.project_url(host: 'jinni.com.ua', id: project.id),
                             caption: project.goal,
                             description: project.about,
                             picture: project.image_full_size
                         }

      )
    end
  end
end
