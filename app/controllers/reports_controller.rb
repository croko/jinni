class ReportsController < ApplicationController
  skip_before_action :require_login, only: [:show]
  before_action :set_project
  before_action :set_report, only: [:edit, :update, :destroy]

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.friendly.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = @project.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to [@project, @report], notice: 'Report was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to [@project, @report], notice: 'Report was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@project), notice: 'Report was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:project_id])
    end

    def set_report
      @report = current_user.projects.friendly.find(params[:project_id]).reports.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:goal, :about, :slug,
                                     photos_attributes: [:id, :main_image, :main_image_cache, :_destroy])
    end
end
