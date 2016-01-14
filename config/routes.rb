Rails.application.routes.draw do
  get '/all' => 'products#all_products'
  get '/' => 'products#beer'
end
