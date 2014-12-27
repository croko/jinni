class OauthsController < ApplicationController
  skip_before_filter :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to projects_path, :notice => "t 'login.success' #{provider.titleize}!"
    else
      begin

        user_hash = sorcery_fetch_user_hash(provider)
        if @user = User.find_by(email: user_hash[:user_info]['email'])
          reset_session # protect from session fixation attack
          auto_login(@user)
          add_provider_to_user(provider)
        else
          @user = create_from(provider)
          # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
          reset_session # protect from session fixation attack
          auto_login(@user)

          if provider == 'google'
            auth = @user.authentications.find_by(provider: 'google')
            auth.update_attribute('avatar_url', user_hash[:user_info]['picture']) if auth
          end

          redirect_to edit_user_path(@user), notice: "t 'registration.success' #{provider.titleize}!" and return
        end

        redirect_to projects_path, :notice => "t 'login.success' #{provider.titleize}!"
      rescue
        redirect_to root_path, :alert =>  "#{t} login.fail #{provider.titleize}!"
      end
    end
  end

  private
  def auth_params
    params.permit(:code, :provider)
  end
end
