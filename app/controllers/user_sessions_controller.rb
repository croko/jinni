class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if user = login(params[:session][:email], params[:session][:password], params[:session][:remember_me])
      redirect_back_or_to(projects_url, notice: 'Login successful')
    else
      flash.now.alert = "#{t 'session.error', default: 'Invalid email/password'}."
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
end
