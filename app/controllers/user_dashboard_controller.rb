class UserDashboardController < ApplicationController
    class UserDashboardController < ApplicationController
        before_action :authenticate_user!
      
        def index
          @user = current_user
          @houses = @user.houses
          @vehicles = @user.vehicles
          @lands = @user.lands
          @activities = Activity.where(user_id: @user.id).order(activity_time: :desc).limit(10)
        end 
end
