Rails.application.routes.draw do

  get   '/orders'     , to: 'orders#index'

  get   '/users'      , to: 'users#index'
  get   '/users/:id'  , to: 'users#show'
  post  '/users'      , to: 'users#create'

  get   '/addresses'  , to: 'addresses#index'
  get   '/items'      , to: 'items#index'

end
