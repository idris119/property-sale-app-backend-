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
    
    private
    
    def set_land
        @land = Land.find(params[:id])
    end
    
    def land_params
        params.require(:land).permit(:image, :name, :location, :size, :price, :description, :amenities, :proximity_to_road, :messaging)
    end
end
