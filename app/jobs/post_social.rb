class PostSocial < ActiveJob::Base
  queue_as :default

  def perform(project, token, provider)
    if provider == 'facebook'
      @api = Koala::Facebook::API.new(token)
      begin
      about = ActionController::Base.helpers.strip_tags(project.about)
      @api.put_wall_post("На https://jinni.com.ua новый проект #{project.title}",
                         {
                             name: project.title,
                             link: Rails.application.routes.url_helpers.project_url(host: 'jinni.com.ua', id: project.id),
                             caption: project.goal,
                             description: about,
                             picture: project.image_full_size
                         }

      )
      rescue => ex
        logger.info(ex)
      end
    end
  end
end
