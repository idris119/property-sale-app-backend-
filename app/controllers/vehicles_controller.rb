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

      # Additional Actions
    
      # Search vehicles by location
      def search_by_location
        vehicles = Vehicle.where("location LIKE ?", "%#{params[:location]}%")
        render json: vehicles
      end
    
      # Filter vehicles by price range
      def filter_by_price_range
        min_price = params[:min_price].to_f
        max_price = params[:max_price].to_f
        vehicles = Vehicle.where(price: min_price..max_price)
        render json: vehicles
      end
    
      # Filter vehicles by brand and model
      def filter_by_brand_and_model
        brand = params[:brand]
        model = params[:model]
        vehicles = Vehicle.where(brand: brand, model: model)
        render json: vehicles
      end
    
      # Sort vehicles by year or price
      def sort_vehicles
        sort_by = params[:sort_by]
        sort_order = params[:sort_order] || 'asc'
        vehicles = Vehicle.order("#{sort_by} #{sort_order}")
        render json: vehicles
      end

    private
    def find_vehicle
        vehicle.find_by(id: params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(:type, :make, :model, :colour, :capacity, :price )
    end

    end
