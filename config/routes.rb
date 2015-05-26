Rails.application.routes.draw do
 
 	
  devise_for :users
  get '/' => 'site#home'
  resources :trainers do
  	resources :trainings
  end

  resources :athletes
  
end
