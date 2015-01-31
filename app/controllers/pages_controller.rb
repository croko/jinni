class PagesController < ApplicationController
  skip_before_action :require_login

  def index
    featured_projects = Project.opened.featured.approved.published.limit(6).order("RANDOM()")
    @projects = featured_projects + Project.opened.exclude_featured.approved.published.limit(6).order("RANDOM()")
    @finished_projects = Project.close.approved.published.limit(8).order("RANDOM()")
    @foundations = Foundation.published.limit(3).order("RANDOM()")
    @users = User.published.active_volunteers.limit(8).order("RANDOM()")

    @projects_cache_key = @projects.sort.collect(&:updated_at).map{|p| p.to_i}.join('')
    @finished_projects_cache_key = @finished_projects.pluck('updated_at').map{|p| p.to_i}.sort.join('')
    @foundations_cache_key = @foundations.pluck('updated_at').map{|p| p.to_i}.sort.join('')
    @users_cache_key = @users.pluck('updated_at').map{|p| p.to_i}.sort.join('')

  end

  def sitemap
    respond_to do |format|
      format.xml { render file: "pages/sitemaps/sitemap.xml" }
      format.html { redirect_to root_url }
    end
  end

end

