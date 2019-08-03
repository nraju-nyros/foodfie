Rails.application.routes.draw do
  devise_for :admin, :controllers =>{
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions',
    :passwords => 'admin/passwords',
    :confirmations => 'admin/confirmations',
    :unlocks => 'admin/unlocks',
  }

  root "home#index"

  resources :admin ,:only => [:index]

  #Admin panel Dishes enter through restaurants
  namespace :admin do
    resources :restaurants do
      resources :dishes
    end
  end

  resources :dishes, :only => [:show]
  resources :restaurants
  resources :locations
  resources :pictures
  resources :dishes_restaurants
  resources :locations_restaurants
  resources :ratings
  resources :home
  
  # search method from homepage
  get '/search' => 'home#search', :as => 'search_page'
  
end
