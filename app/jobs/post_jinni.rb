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

      @page_graph.put_wall_post('Размещен новый проект!',
                                {
                                    name: project.title,
                                    link: Rails.application.routes.url_helpers.project_url(host: 'jinni.com.ua', id: project.id),
                                    caption: project.goal.html_safe,
                                    description: project.about,
                                    picture: project.image_full_size
                                }

      )
      rescue => ex
        logger.info(ex)
      end
    end
  end
end