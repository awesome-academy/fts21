class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :load_token
  before_action :load_user_omniauth

  def google_oauth2
    if @user_omniauth
      flash[:success] = t "devise.omniauth_callbacks.google.success"
      sign_in_and_redirect @user_omniauth, event: :authentication
    elsif user_signed_in?
      current_user.update_attributes provider: @token.provider, uid: @token.uid
      flash[:info] = t "devise.omniauth_callbacks.google.connected_success"
      after_sign_in_path_for current_user
    else
      flash[:danger] = t "devise.omniauth_callbacks.google.not_connect"
      redirect_to root_path
    end
  end

  private

  def load_token
    @token = request.env["omniauth.auth"]
    return @token if @token
    flash[:danger] = t "devise.omniauth_callbacks.unauthorized"
    redirect_to root_path
  end

  def load_user_omniauth
    @user_omniauth = User.find_by provider: @token.provider, uid: @token.uid
  end
end
