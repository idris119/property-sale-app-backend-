class HousesController < ApplicationController
       #used to hinder repetition of code 
       before_action :set_house, only: [:show, :edit, :update, :destroy]
  
       def index
         house = House.all
         render json: house
       end
     
       def show
        house = House.find_by(id: params[:id])
        render json: house
       end
     
     
       def create
   
         House = House.create(house_params)
           if House.save
               render json: House.to_json(except: [:created_at, :updated_at]), status: :created
             else
               render json: { error: "Failed to create House" }, status: :unprocessable_entity
             end   
            end
     
     
       def update
           House = find_House
           if House.update(house_params)
             render json: House.to_json(except: [:created_at, :updated_at])
           else
             render json: { error: "Failed to update House" }, status: :unprocessable_entity
           end
         
       end
     
       def destroy
           House = find_House
           if House.destroy
             head :no_content, status: :no_content
           else
             render json: { error: "Failed to delete House" }, status: :unprocessable_entity
           end
        
       end
     
       private
     
       def set_house
         House.find_by(id :params[:id])
       end
     
       def house_params
         params.require(:house).permit(:type, :bedrooms, :price, :distance, :description)
       end
     end
end
