class UsersController < ApplicationController

   def index 
       users = User.all
       render json: users
   end

   # get a single user
   def show
       user = user.find_by(id: params[:id])
       if user 
           render json: user

       else
          render json: {error: "user not found"}, status: :not_found
          
       end  
   end 

   def create 
        user = User.create(name: params[:name], email: params[:email], phone_number: params[:phone_number],password: params[:password])
        if user.valid?
            render json: { "success": "User saved successfully!"}
        else
            render json: user.errors.messages
        end
   end

   def loggedin
     user = User.find_by(id: session[:user_id] ) 
     if(user)
        render json: {loggedin: true, user: user}
     else
        render json: {loggedin: false}
     end      
   end

end