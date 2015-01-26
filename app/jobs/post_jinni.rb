class PostJinni < ActiveJob::Base
  queue_as :default

  def perform(project, provider)
    if provider == 'facebook'
      begin
      token = User.first.authentications.facebook.first.access_token
      @api = Koala::Facebook::API.new(token)
      pages = @api.get_connections('me', 'accounts')
      page_token = pages.first['access_token']
      @page_graph = Koala::Facebook::API.new(page_token)
      about = ActionController::Base.helpers.strip_tags(project.about)
      @page_graph.put_wall_post("Новый проект #{project.title}",
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