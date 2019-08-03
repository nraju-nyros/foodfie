class HomeController < ApplicationController
  def index
    @dishes = Dish.paginate(:page => params[:page], :per_page => 6)
      respond_to do |format|
        format.html
        format.js
      end
  end

  def search 
    map_location
    if  params[:search]
     @dishes = Dish.all.where("name LIKE ?", "%#{params[:search]}%")
    end 

    if params[:price]
      @dishes = Dish.by_price(params[:price]).where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:ratings]
      @dishes = Dish.by_rating.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:ratings_filter]
     @dishes = Dish.sort_ratings(params[:ratings_filter]).where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:category]
      @dishes = Dish.by_category(params[:category]).where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:restaurant_id]
     @restaurant = Restaurant.find(params[:restaurant_id])
     @dishes = @restaurant.dishes
    end

  end

  # locations to maps
  private
  def map_location
    @dishes = Dish.all.where("name LIKE ?", "%#{params[:search]}%")
    locations = []
    restaurant = []
    @dishes.each do |d|
      d.restaurants.each do |r|
          restaurant.push(r)
        r.locations.each do |l|   
          locations.push(l)
        end
      end 
    end
      gon.locations = locations 
      gon.restaurant = restaurant
      

      # restaurant dishes count
      restaurant_dish = []
      restaurant.each do |k|
        count =  k.dishes.count
        restaurant_dish.push(count)
      end
      gon.restaurant_dish = restaurant_dish


      # restaurant pictures
      pictures = []
      restaurant.each do |r|
        r.pictures.each do |p|
          pictures.push(p)
        end
      end
      gon.pictures = pictures
      puts pictures
  end
end