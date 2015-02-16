class ProjectsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_project, only: [:edit, :update, :destroy]

  include PaymentProcessing

  # GET /projects
  # GET /projects.json
  def index
    if params[:tag].present?
      @q = Project.opened.approved.published.tagged_with(params[:tag]).search(params[:q])
    else
      @q = Project.opened.approved.published.search(params[:q])
    end
    @projects = @q.result.sorted.page params[:page]
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.friendly.find(params[:id])
    @payment = Payment.new

    if current_user && @project.try(:user) == current_user
        @project = current_user.projects.friendly.find(params[:id])
      else
        @project = Project.published.approved.friendly.find(params[:id])
    end
    set_meta_tags og: {
                      title: @project.title,
                      description: @project.goal,
                      url: project_url(@project),
                      image: @project.image_full_size
                  }
    set_meta_tags twitter: {
                      card: 'product',
                      site: '@JinniUA',
                      domain: project_url(@project),
                      title:  @project.title,
                      image:  @project.image_full_size
                  }
    if @project.payment_ready
      liqpay_form(@project)
    end
    # fresh_when(etag: @project, last_modified: @project.updated_at)
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
    params.require(:project).permit(:title, :goal, :about, :foundation_id, :date_start, :date_end, :category_id, :amount, :published, :tag_list, :share,
                                    :location, :payment_system_id, :fixed_price,
                                    photos_attributes: [:id, :main_image, :main_image_cache, :_destroy])
  end
end
