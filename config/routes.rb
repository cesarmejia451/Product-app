Rails.application.routes.draw do

  devise_for :users
  root 'products#index' 

  get '/products' => 'products#index'
  get '/' => 'products#beer'
  get 'products/new' => 'products#new'
  post '/products' => 'products#create'

  get 'suppliers/new' => 'suppliers#new'
  post '/suppliers' => 'suppliers#create'

  get 'products/random' => 'products#random'
  
  get 'products/:id' => 'products#show'
  
  get 'products/:id/edit' => 'products#edit'
  patch 'products/:id' => 'products#update'

  delete 'products/:id' => 'products#destroy'

  post '/search' => 'products#search'
  

  get 'suppliers/:id/edit' => 'suppliers#edit'
  patch 'suppliers/:id' => 'suppliers#update'

  post '/orders' => 'orders#create'
  get 'orders/:id' => 'orders#show'

  post '/checkout' => 'carted_product#create'

end
