class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, :except => "session#new"
  
  def authenticate_admin_user!(opts = {})
    render_403 and return if user_signed_in? && !current_user.admin?
    authenticate_user!
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end
end