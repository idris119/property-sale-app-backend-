class LandsController < ApplicationController
    before_action :set_land, only: [:show, :update, :destroy]
    
    # GET /lands
    def index
        @lands = Land.all
        render json: @lands
    end
    
    # GET /lands/1
    def show
        render json: @land
    end
    
    # POST /lands
    def create
        @land = Land.new(land_params)
    
        if @land.save
            render json: @land, status: :created, location: @land
        else
            render json: @land.errors, status: :unprocessable_entity
        end
    end
    
    # PATCH/PUT /lands/1
    def update
        if @land.update(land_params)
            render json: @land
        else
            render json: @land.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /lands/1
    def destroy
        @land.destroy
        render json: { message: 'Land deleted successfully' }
    end

    # Additional Actions
  
    # Search lands by location
    def search_by_location
      lands = Land.where("location LIKE ?", "%#{params[:location]}%")
      render json: lands
    end
  
    # Filter lands by price range
    def filter_by_price_range
      min_price = params[:min_price].to_f
      max_price = params[:max_price].to_f
      lands = Land.where(price: min_price..max_price)
      render json: lands
    end
  
    # Fetch featured lands
    def featured_lands
      lands = Land.where(featured: true)
      render json: lands
    end
  
    # Sort lands by size or price
    def sort_lands
      sort_by = params[:sort_by]
      sort_order = params[:sort_order] || 'asc'
      lands = Land.order("#{sort_by} #{sort_order}")
      render json: lands
    end
    
    private
    
    def set_land
        @land = Land.find(params[:id])
    end
    
    def land_params
        params.require(:land).permit(:image, :name, :location, :size, :price, :description, :amenities, :proximity_to_road, :messaging)
    end
end
