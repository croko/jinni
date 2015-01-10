class PostJinni < ActiveJob::Base
  queue_as :default

  def perform(project, token, provider)
    if provider == 'facebook'
      @api = Koala::Facebook::API.new(token)
      pages = @api.get_connections('me', 'accounts')
      page_token = pages.first['access_token']
      @page_graph = Koala::Facebook::API.new(page_token)

      @page_graph.put_wall_post('Размещен новый проект!',
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