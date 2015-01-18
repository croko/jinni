class FoundationsController < ApplicationController
  before_action :set_foundation, only: [:show]

  # GET /foundations
  # GET /foundations.json
  def index
    @foundations = Foundation.published
  end

  # GET /foundations/1
  # GET /foundations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foundation
      @foundation = Foundation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foundation_params
      params.require(:foundation).permit(:name)
    end
end
