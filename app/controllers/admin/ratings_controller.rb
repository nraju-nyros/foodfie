class RatingsController < ApplicationController

	def index
    @rating = Rating.all
  end
  
  def show
    @rating = rating.find(params[:id])
  end

  def new 
     @rating = Rating.new
  end   
   
  def create 
    @rating = rating.find(params[:rating_id])
    @rating = @rating.ratinges.create(rating_params) 
    if @rating.save 
      respond_to do |format|
        format.html { redirect_to rating_ratinges_path, notice: 'rating succesfully created' }
      end   
    else   
      render :new   
    end   
  end  

  def edit 
    @rating = rating.find(params[:id]) 
  end 
   
  def update   
    @rating = rating.find(params[:id])   
    if @rating.update_attributes(rating_params)   
      redirect_to rating_ratinges_path
    else     
      render :edit   
    end   
  end   

  def destroy   
    @rating = rating.find(params[:id])   
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to rating_ratinges_path, notice: 'rating succesfully deleted' }
    end    
  end   
   
  private

  def rating_params   
    params.require(:rating).permit(:name, :price, :category_id,
    pictures_attributes: [:id, :image]) 
  end   

end
