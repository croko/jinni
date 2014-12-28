class ProjectsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_project, only: [:edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    if params[:pr] == 'my'
      @projects = current_user.projects
    else
      @projects = Project.open.approved.published.sorted
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.friendly.find(params[:id])

    if @project.payment_system.present?
      Liqpay.default_options = {
         public_key:  @project.payment_system.public_key,
         private_key:  @project.payment_system.private_key,
         language: 'ru'
      }

      @liqpay_request = Liqpay::Request.new(
        amount: '1000',
        currency: 'UAH',
        order_id: @project.id,
        description: @project.title,
        type: 'donate',
        result_url: project_url(@project),
        server_url: liqpay_callback_url
      )
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tags
    render json: Project.project_tag_names(params[:q])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = current_user.projects.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :goal, :about, :foundation_id, :date_start, :date_end, :category_id, :amount, :published, :tag_list,
                                    :location, :payment_system_id,
                                    photos_attributes: [:id, :main_image, :main_image_cache, :_destroy])
  end
end
