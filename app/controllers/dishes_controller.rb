class DishesController < ApplicationController
	def index
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new 
  end   
   
  def create 
  end  


  def edit 
  
  end 
   
  def update   
  end   

  def destroy    
  end   
   
  private
  def dish_params   
    params.require(:dish).permit(:name, :price, :category_id,
    pictures_attributes: [:id, :image]) 
  end   
end
