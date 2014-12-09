class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
	  @user = User.new(safe_params)

	  if @user.save
	  	auto_login(@user)
#TODO
      UserMailer.welcome(@user).deliver

      redirect_to root_url
    else
     render :new
	  end
	end

  private

    def safe_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end

end