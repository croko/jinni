class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  skip_before_action :require_login

  def show
    @q = @category.projects.opened.approved.published.search(params[:q])
    @projects = @q.result.sorted.page params[:page]
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
    end
end
