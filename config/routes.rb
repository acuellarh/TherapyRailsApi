Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/pacients' => 'pacients#index'
  namespace :api do  
    namespace :v1 do
      resources :genders, only: [:index, :create]  
      resources :relationships, only: [:index, :create] 
      resources :document_types, only: [:index, :create] 
      resources :pacients, only: [:index, :create, :destroy, :update]   
      resources :orders, only: [:index, :create] 
<<<<<<< HEAD
      resources :product_categories, only: [:index, :create, :destroy, :update] 
=======
      resources :product_categories, only: [:index, :create] 
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
      resources :products, only: [:index, :create] 
    end
  end  
end
