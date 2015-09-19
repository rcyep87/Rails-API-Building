Rails.application.routes.draw do

  get     '/users'          , to: 'users#index'
  get     '/users/:id'      , to: 'users#show'
  post    '/users'          , to: 'users#create'
  put     '/users/:id'      , to: 'users#update'
  delete  '/users/:id'      , to: 'users#destroy'

  get     '/addresses'      , to: 'addresses#index'
  get     '/addresses/:id'  , to: 'addresses#show'
  post    '/addresses'      , to: 'addresses#create'
  put     '/addresses/:id'  , to: 'addresses#update'
  delete  '/addresses/:id'  , to: 'addresses#destroy'

  get     '/items'          , to: 'items#index'
  get     '/items/:id'      , to: 'items#show'
  post    '/items'          , to: 'items#create'
  put     '/items/:id'      , to: 'items#update'
  delete  '/items/:id'      , to: 'items#destroy'

  get     '/orders'         , to: 'orders#index'
  get     '/orders/:id'     , to: 'orders#show'

  put     '/orders/:id'     , to: 'orders#update'
  delete  '/orders/:id'     , to: 'orders#destroy'

end
