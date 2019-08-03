class Admin::DishesController < ApplicationController
	def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dishes =   @restaurant.dishes.all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new 
    @dish = Dish.new
    @dish.pictures.build
  end   
   
  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = @restaurant.dishes.create(dish_params) 
    if @dish.save 
      respond_to do |format|
        format.html { redirect_to admin_restaurant_dishes_path, notice: 'dish succesfully created' }
      end   
    else   
      render :new   
    end   
  end  


  def edit 
    @dish = Dish.find(params[:id]) 
  end 
   
  def update   
    @dish = Dish.find(params[:id])   
    if @dish.update_attributes(dish_params)   
      redirect_to admin_restaurant_dishes_path
    else     
      render :edit   
    end   
  end   

  def destroy   
    @dish = Dish.find(params[:id])   
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to admin_restaurant_dishes_path, notice: 'dish succesfully deleted' }
    end    
  end   
   
  private
  def dish_params   
    params.require(:dish).permit(:name, :price, :category_id,
    pictures_attributes: [:id, :image]) 
  end   
end
