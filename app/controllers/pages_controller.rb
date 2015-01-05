class PagesController < ApplicationController
  skip_before_action :require_login

  def index
     @featured_projects = Project.open.approved.featured.published.limit(3).order("RANDOM()")
     @projects = Project.open.exclude_featured.approved.published.limit(3).order("RANDOM()")
     @foundations = Foundation.published.limit(3).order("RANDOM()")
  end
end
