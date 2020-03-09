class BaseController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Pundit
  protect_from_forgery with: :exception

  #before_action :doorkeeper_authorize!

end
