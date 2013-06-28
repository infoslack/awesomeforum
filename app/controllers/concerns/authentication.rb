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
    unless logged_in?
    redirect_to login_path(return_to: request.fullpath),
      alert: t("flash.require_logged_user.alert")
    end
  end

  def return_url
    uri = URI.parse(params.fetch(:return_to, root_path))
    path = uri.path
    path << "?#{uri.query}" if uri.query
    path << "##{uri.fragment}" if uri.fragment
    path
  rescue URI::InvalidURIError
    root_path
  end
end
