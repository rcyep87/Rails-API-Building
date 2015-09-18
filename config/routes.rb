Rails.application.routes.draw do

  get '/orders'     , to: 'orders#index'
  get '/users'      , to: 'users#index'
  get '/addresses'  , to: 'addresses#index'
  get '/items'      , to: 'items#index'

end
