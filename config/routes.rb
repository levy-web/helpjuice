Rails.application.routes.draw do
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  post 'search', to: 'search#index', as: 'search'

  post 'search/suggestions', to: 'search#suggestions', as: 'search_suggestions'
end
