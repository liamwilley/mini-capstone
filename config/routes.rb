Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'products#index'
  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
  get '/products/:id', to: 'products#show'
  post '/products', to: 'products#create'
  get '/products/:id/edit', to: 'products#edit'
  patch '/products/:id', to: 'products#update'
  delete '/products/:id', to: 'products#destroy'
  post '/products/new', to: 'products#new'
  get '/images/new', to: 'images#new'
  post '/images/create', to: 'images#create'
  
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  post '/orders', to: 'orders#create'
  get '/orders', to: 'orders#show'


  post '/carted_products', to: 'carted_products#create'
  get '/carted_products', to: 'carted_products#index'
  delete '/carted_products/:id', to: 'carted_products#destroy'
end
