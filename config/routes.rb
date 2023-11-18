Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/pacients' => 'pacients#index'
  namespace :api do  
    namespace :v1 do
      resources :pacients, only: [:index, :create, :destroy, :update]   
      resources :genders, only: [:index, :create]  
      resources :relationships, only: [:index, :create] 
      resources :document_types, only: [:index, :create] 
    end
  end  
end
