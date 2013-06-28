module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :logged_in?
  end

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_logged_user
    redirect_to root_path if logged_in?
  end

  def require_logged_user
    redirect_to login_path,
      alert: t("flash.require_logged_user") unless logged_in?
  end
end
