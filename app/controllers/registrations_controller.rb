class RegistrationsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
	  @user = User.new(safe_params)

    if @user.password.blank?
       @user.errors.add(:password, :blank)
    end

    if @user.password.present? && @user.save
	  	auto_login(@user)

      redirect_to edit_user_path(@user), notice: "t 'registration.success'"
    else
     render :new
	  end
	end

  private

    def safe_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end

end