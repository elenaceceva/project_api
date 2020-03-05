class BaseController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Pundit
  protect_from_forgery with: :exception

  def index
    @tasks = Task.all
    render json: { status: 'SUCCESS', messsage:'Loaded posts', data: @tasks }
  end
end
