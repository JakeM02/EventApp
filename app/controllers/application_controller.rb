class ApplicationController < ActionController::Base
  include SessionsHelper
  allow_browser versions: :modern

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end
end
