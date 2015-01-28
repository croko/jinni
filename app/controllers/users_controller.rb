class UsersController < ApplicationController
  skip_before_action :require_login, only: [:show, :new, :create]
  before_action :set_user, only: [:edit, :update]
  force_ssl if: :ssl_configured?, only: [:edit, :update, :create]

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.published.find(params[:id])
    @my_projects = false
    if current_user && @user == current_user
      @projects = current_user.projects
      @my_projects = true
      else
      @projects = @user.projects.approved.published
    end
    @finished_projects = @user.finished_projects
  end

  # GET /users/new
  def new
    @user = User.new
    @user.addresses.build
  end

  # GET /users/1/edit
  def edit
    @user.addresses.build unless @user.addresses.any?
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def ssl_configured?
    !Rails.env.development?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :with_foundation, :image, :image_cache, :about, :remove_image,
                                 :twitter_url, :facebook_url, :google_url, :publish,
                                 payment_systems_attributes: [:id, :name, :payment_gateway_id, :public_key,
                                                              :private_key, :active, :_destroy],
                                 addresses_attributes: [:id, :address_1, :address_2, :city_id,
                                                        :website_url, :email, :phone_number,
                                                        :mobile_1, :mobile_2, :_destroy])
  end
end
