class ApplicationController < ActionController::API
  include ActionController::Cookies

  private

  def authorize
    current_user = User.find_by(id: session[:user_id])

    if current_user.nil?
      render json: { "error": "not authorized" }
    end
  end
end
