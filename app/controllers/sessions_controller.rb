class SessionsController < ApplicationController
  before_action :load_user, only: :create
  before_action :redirect_to_root, if: :logged_in?, only: %i(new create)

  def new; end

  def create
    if @user&.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == Settings.user.remember ? remember(@user) : forget(@user)
      redirect_with_rule @user
    else
      flash.now[:danger] = t "sessions.create.login_error"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def load_user
    @user = User.find_by email: params[:session][:email].downcase
    @user || render(file: "public/404.html", status: 404, layout: true)
  end

  def redirect_with_rule user
    user.trainee? ? redirect_to(trainee_root_path) : redirect_to(courses_path)
  end
end
