class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  skip_before_action :require_login

  def show
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
      @projects = @category.projects.open.approved.published.sorted
    end
end
