class PropertiesController < ApplicationController
    def lands
      @lands = Land.where(is_approved: true)
      render json: @lands
    end
  
    def vehicles
      @vehicles = Vehicle.where(is_approved: true)
      render json: @vehicles
    end

    def Houses
        @houses = Houses.where(is_approved: true)
        render json: @houses
    end
end
