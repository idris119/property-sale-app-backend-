class SessionController < ApplicationController
     skip_before_action :authorize, only: [:login]

    def login
      email = params[:email]
      password = params[:password]
  
      user = User.find_by(email: email)
  
      if user && user.authenticate(password)
        session[:user_id] = user.id
        render json: { success: "Login successful" }
        # Implement login logic here
      else
        render json: { error: "Wrong email/password" }
      end
    end

    def logout
        session.delete :user_id
        render json: { success: "Logout successful" }

    end    
  end
  