module API
  module V1
    class BaseController < ActionController::API
      include ActionController::RequestForgeryProtection

      protect_from_forgery with: :exception
    end
  end
end

