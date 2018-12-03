class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  def user_id
    authenticate_with_http_basic do |email, password|
      user = User.find_by(email: email)
      if user && user.password == password
        render json: { id: user.id }
      else
        render json: { error: 'Incorrect credentials' }, status: 401
      end
    end
  end
end
