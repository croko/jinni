class OauthsController < ApplicationController
  skip_before_filter :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    begin
      if @user = login_from(provider)
        redirect_to projects_path, :notice => "#{t 'session.login_success'} #{provider.titleize}!"
      else
        user_hash = sorcery_fetch_user_hash(provider)
        if @user = User.find_by(email: user_hash[:user_info]['email'])
          reset_session # protect from session fixation attack
          auto_login(@user)
          add_provider_to_user(provider)
          fb_posts(provider)
        else
          @user = create_from(provider)
          # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
          reset_session # protect from session fixation attack
          auto_login(@user)
          fb_posts(provider)
          if provider == 'google'
            auth = @user.authentications.find_by(provider: 'google')
            auth.update_attribute('avatar_url', user_hash[:user_info]['picture']) if auth
          end
          redirect_to edit_user_path(@user), notice: "#{t 'session.registration_success'} #{provider.titleize}!" and return
        end
        redirect_to projects_path, :notice => "#{t 'session.login_success'} #{provider.titleize}!"
      end
    rescue
      redirect_to login_url, alert: "#{t 'session.login_fail'} #{provider.titleize}!"
    end
  end

  def fb_posts(provider)
    # for FB posts
    if provider == 'facebook'
      auth_fb = @user.authentications.find_by(provider: 'facebook')
      auth_fb.update_column('access_token', @access_token.token.to_s)
    end
  end


  private
  def auth_params
    params.permit(:code, :provider)
  end
end
