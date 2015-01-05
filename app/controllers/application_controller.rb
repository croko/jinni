class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login, :get_categories, :latest_projects

  def get_categories
    @categories = Category.sorted
  end

  def latest_projects
    @latest_projects = Project.open.approved.published.sorted.limit(5)
    @latest_finished_projects = Project.close.approved.published.limit(3)
  end

  private
  def not_authenticated
    redirect_to main_app.login_path
    # redirect_to login_url, alert: "Please login first"
  end
end
