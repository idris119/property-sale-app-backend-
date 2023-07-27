class HousesController < ApplicationController
  before_action :set_house, only: [:index, :show]

  def index
    houses = House.all
    render json: houses
  end

  def approvedhouses
    houses = House.where(is_approved: true)
    render json: houses
  end


  def show
    render json: @house
  end

  def create
    house = House.new(house_params)
    if house.save
      render json: house.to_json(except: [:created_at, :updated_at]), status: :created
    else
      render json: { error: "Failed to create House" }, status: :unprocessable_entity
    end
  end

  def update
    if @house.update(house_params)
      render json: @house.to_json(except: [:created_at, :updated_at])
    else
      render json: { error: "Failed to update House" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @house.destroy
      head :no_content, status: :no_content
    else
      render json: { error: "Failed to delete House" }, status: :unprocessable_entity
    end
  end

  def approve
    current_user=User.find_by(id: session[:user_id])
    if current_user.is_admin==true
      house = House.find_by(id: params[:id]) 
      if house
          house.update(is_approved: true)
          render json: {success: "house Approved... Can be seen by users"}, status: :created
      else
          render json: {error: "house not found"}, status: :not_found
      end
    else
        render json: {error: "Only admin can perform such operation"}, status: :not_found
    end
  end

  # Additional Actions

  def search_by_location
    houses = House.where("location LIKE ?", "%#{params[:location]}%")
    render json: houses
  end

   # Filter houses by price range
  def filter_by_price_range
    min_price = params[:min_price].to_f
    max_price = params[:max_price].to_f
    houses = House.where(price: min_price..max_price)
    render json: houses
  end
  # Fetch featured houses
  def featured_houses
    houses = House.where(featured: true)
    render json: houses
  end
  # Popular Houses: Fetch and display houses based on popularity (number of views)
  def popular_houses
    houses = House.order(views: :desc).limit(10)
    render json: houses
  end


  private

  def set_house
    @house = House.find_by(id: params[:id])
  end

  def house_params
    params.require(:house).permit(:location, :size, :price, :bedrooms, :bathrooms, :amenities, :images)
  end
end