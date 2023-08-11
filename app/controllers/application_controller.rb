# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include ActionController::Cookies
  skip_before_action : authorize, only[ :index, :show ]

  def search
    property_type = params[:property_type]
    query = params[:query]
    location = params[:location]
    min_price = params[:min_price]
    max_price = params[:max_price]
    sort_by = params[:sort_by]
    sort_order = params[:sort_order]
  
    # Construct your query based on the property type
    if property_type == 'lands'
      properties = Land.where("name LIKE ? OR location LIKE ?", "%#{query}%", "%#{location}%")
                       .where(price: min_price..max_price)
                       .order("#{sort_by} #{sort_order}")
    elsif property_type == 'houses'
      properties = House.where("type LIKE ? OR location LIKE ?", "%#{query}%", "%#{location}%")
                        .where(price: min_price..max_price)
                        .order("#{sort_by} #{sort_order}")
    elsif property_type == 'vehicles'
      properties = Vehicle.where("make LIKE ? OR model LIKE ?", "%#{query}%", "%#{location}%")
                          .where(price: min_price..max_price)
                          .order("#{sort_by} #{sort_order}")
    else
      # Handle invalid property types here
      properties = []
    end
  
    render json: { property_type => properties }
  end
  

  private

  def authorize
    @current_user = User.find_by(id: session[:user_id])

    if @current_user.nil?
      render json: { "error": "not authorized" }, status: :unauthorized
    end
  end
end