class VehiclesController < ApplicationController

    # get all vehicles
    def index
        vehicles = Vehicle.all
        render json: vehicles
    end

    # get vehicle by id
    def show
        vehicle = Vehicle.find_by(id: params[:id])
        render json: vehicle
    end

    # post vehicles
    def create
        vehicle = Vehicle.create(vehicle_params)
        if vehicle.save
            render json: vehicle.to_json(except: [:created_at, :updated_at]), status: :created
          else
            render json: { error: "Failed to create vehicle" }, status: :unprocessable_entity
          end   
         end

    # patch vehicles
    def update
        vehicle = find_vehicle
        if vehicle.update(vehicle_params)
          render json: vehicle.to_json(except: [:created_at, :updated_at])
        else
          render json: { error: "Failed to update vehicle" }, status: :unprocessable_entity
        end
      end
    
    # delete vehicle
    def destroy
        vehicle = find_vehicle
        if vehicle.destroy
          head :no_content, status: :no_content
        else
          render json: { error: "Failed to delete vehicle" }, status: :unprocessable_entity
        end
      end

    private
    def find_vehicle
        vehicle.find_by(id: params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(:type, :make, :model, :colour, :capacity, :price )
    end

    end
