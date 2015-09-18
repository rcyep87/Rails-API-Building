Rails.application.routes.draw do

  get     '/orders'     , to: 'orders#index'

  get     '/users'      , to: 'users#index'
  get     '/users/:id'  , to: 'users#show'
  post    '/users'      , to: 'users#create'
  put     '/users/:id'  , to: 'users#update'
  delete  '/users/:id'  , to: 'users#delete'

  get     '/addresses'  , to: 'addresses#index'
  get     '/items'      , to: 'items#index'

end
