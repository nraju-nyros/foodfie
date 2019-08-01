class Admin::RestaurantsController < ApplicationController
	def index
    @restaurants = Restaurant.all.order(created_at: :asc).paginate(page:  params[:page], per_page: 5)
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new 
    @restaurant = Restaurant.new
    @restaurant.pictures.build
    @restaurant.locations.build  
  end   
   
  def create   
    @restaurant = Restaurant.new(restaurant_params)   
    if @restaurant.save   
      respond_to do |format|
        format.html { redirect_to admin_restaurants_path, notice: 'Restaurant succesfully created' }
      end  
    else   
      render :new   
    end   
  end  


  def edit 
    @restaurant = Restaurant.find(params[:id]) 
    @dishes_restaurants = DishesRestaurant.all
  end 
   
  def update   
    @restaurant = Restaurant.find(params[:id])   
    if @restaurant.update_attributes(restaurant_params)   
      redirect_to admin_restaurants_path 
    else     
      render :edit   
    end   
  end   

  def destroy   
   @restaurant = Restaurant.find(params[:id])   
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to admin_restaurants_path, notice: 'restaurant succesfully deleted' }
    end    
  end   
   
  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :phone, :email,
    pictures_attributes: [:id, :image], locations_attributes: [:id, :street,  :city, :state, :pincode, :country, :latitude, :longitude], dishes_attributes: [:id, :name])
  end 
  
end
