Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  root :to => "displacements#index" 

  resources :displacements
  resources :cars
  resources :addresses
  resources :functionaries


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
