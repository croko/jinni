class PagesController < ApplicationController
  skip_before_action :require_login

  def index
    featured_projects = Project.opened.featured.approved.published.limit(6).order("RANDOM()")
    @projects = featured_projects + Project.opened.exclude_featured.approved.published.limit(6).order("RANDOM()")
    @finished_projects = Project.close.approved.published.limit(8).order("RANDOM()")
    @foundations = Foundation.published.limit(3).order("RANDOM()")
  end
end
