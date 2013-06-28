class LoginController < ApplicationController
  before_action :redirect_logged_user, except: "destroy"

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to params.fetch(:return_to, root_path)
    else
      flash.now[:alert] = t("flash.login.create.alert")
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
