Rails.application.routes.draw do
 
 	
  get '/' => 'site#home'
  resources :users do
  	resources :trainings
  end
  
end
