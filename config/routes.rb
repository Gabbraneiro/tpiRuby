Rails.application.routes.draw do

  ## Servicios que no requieren token de autenticación

  post 'sesiones', to: 'authentication#authenticate' # Hecho
  post 'usuarios', to: 'users#create'

  ## Servicios que requieren token de autenticación

  get 'productos', to: 'products#index' # Hecho

  get 'productos/:codigo', to: 'products#show' # Hecho

  get 'productos/:codigo/items', to: 'products#items' # Hecho

  post 'productos/:codigo/items', to: 'products#add_item' # Hecho

  get 'reservas', to: 'reservations#index' # Hecho

  get 'reservas/:id', to: 'reservations#show' # Hecho

  post 'reservas', to: 'reservations#create' # Hecho

  put 'reservas/:id/vender', to: 'reservations#vender' # Hecho

  delete 'reservas/:id', to: 'reservations#destroy'

  get 'ventas', to: 'sells#index'

  get 'ventas/:id', to: 'sells#show'

  post 'ventas', to: 'sells#create'
  

end
