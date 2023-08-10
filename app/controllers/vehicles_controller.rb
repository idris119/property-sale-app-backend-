class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :search]

  # get all vehicles
  def index
    vehicles = Vehicle.all
    render json: vehicles
  end

  def approvedvehicles
    vehicles = Vehicle.where(is_approved: true)
    render json: vehicles
  end

  def vehiclesneedingapproval
    vehicles_needing_approval = Vehicle.where(is_approved: false)
    render json: vehicles_needing_approval
  end


  # get vehicle by id
  def show
    render json: @vehicle
  end

  # post vehicles
  def create
    vehicle = Vehicle.new(vehicle_params)
    if vehicle.save
      render json: vehicle, status: :created
    else
      render json: { error: "Failed to create vehicle" }, status: :unprocessable_entity
    end
  end

  # patch vehicles
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: { error: "Failed to update vehicle" }, status: :unprocessable_entity
    end
  end

  # delete vehicle
  def destroy
    if @vehicle.destroy
      head :no_content
    else
      render json: { error: "Failed to delete vehicle" }, status: :unprocessable_entity
    end
  end

  def approve
    current_user = User.find_by(id: session[:user_id])
    if current_user.is_admin == true
      vehicle = Vehicle.find_by(id: params[:id])
      if vehicle
        vehicle.update(is_approved: true)
        render json: { success: "Vehicle Approved... Can be seen by users" }, status: :created
      else
        render json: { error: "Vehicle not found" }, status: :not_found
      end
    else
      render json: { error: "Only admin can perform this operation" }, status: :forbidden
    end
  end

  def approve
    vehicle = Vehicle.find(params[:id])
    vehicle.update(is_approved: true)
    render json: { message: "Vehicle approved successfully" }
  end


  # Additional Actions

  # Search vehicles by location
  def search
    search_query = params[:q]
    # Use the 'Vehicle' model to search the vehicles table in the database
    results = Vehicle.where("name LIKE ?", "%#{search_query}%")
    render json: results
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

  def set_vehicle
    @vehicle = Vehicle.find_by(id: params[:id])
    render json: { error: "Vehicle not found" }, status: :not_found unless @vehicle
  end

  def find_vehicle
    Vehicle.find_by(id: params[:id])
  end

  def vehicle_params
    params.permit(:vehicle_type, :make, :model, :colour, :capacity, :image, :price)
  end
end