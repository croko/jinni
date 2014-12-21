class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
      @projects = @category.projects.open.approved.published.sorted
    end
end
