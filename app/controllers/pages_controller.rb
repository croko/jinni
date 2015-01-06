class PagesController < ApplicationController
  skip_before_action :require_login

  def index
    @featured_projects = Project.opened.approved.featured.published.limit(3).order("RANDOM()")
    @projects = Project.opened.exclude_featured.approved.published.limit(3).order("RANDOM()")
    @finished_projects = Project.close.approved.published.limit(8).order("RANDOM()")
    @foundations = Foundation.published.limit(3).order("RANDOM()")

    project = @projects.first
    set_meta_tags og: {
                      title: project.title,
                      description: project.goal,
                      url: root_url,
                      image: project.image_full_size
                  }

    set_meta_tags twitter: {
                      card: "summary_large_image",
                      site: root_url,
                      title: project.title,
                      image: {src: project.image_full_size}
                  }
  end
end
