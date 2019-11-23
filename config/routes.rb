Rails.application.routes.draw do
  # resources :item_reservations
  # resources :reservation_sells
  # resources :item_sells
  # resources :items
  # resources :products
  # resources :reservation_details
  # resources :sell_details
  # resources :reservations
  # resources :sells
  # resources :users
  # resources :contact_phones
  # resources :clients
  # resources :vat_conditions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Servicios que no requieren token de autenticación
  post 'sesiones', to: 'authentication#authenticate'
  post 'usuarios', to: 'users#create'

  # Servicios que requieren token de autenticación

  # Retorna todos los productos que se tienen, filtrándolos por alguno de los siguientes
  # criterios, según el valor recibido opcionalmente en el parámetro q de la petición:
  #   • in_stock (filtro por defecto, en caso que no se especifique uno): retorna únicamente los productos con stock disponible.
  #   • scarce : retorna aquellos productos cuyo stock es de entre 1 y 5 unidades.
  #   • all : retorna todos los productos, aún aquellos sin stock disponible.
  # La cantidad máxima de elementos a retornar en este servicio es de 25
  get 'productos', to: 'products#index' # Hecho

  # Retorna la información referente al producto identificado por el código recibido en el parámetro codigo .
  # En caso de no existir el producto solicitado, se retorna un HTTP status 404 Not found.
  get 'productos/:codigo', to: 'products#show' # Hecho

  # Retorna todos los items asociados al producto identificado por el código recibido en el  parámetro codigo .
  # De cada item se incluye el estado del mismo y el valor de venta.
  # En caso de no existir el producto solicitado, se retorna un HTTP status 404 Not found.
  get 'productos/:codigo/items', to: 'products#items' # Hecho

  # Crea ítems para el producto identificado por el código recibido en el parámetro codigo .
  # En el cuerpo de la petición se recibe la cantidad de ítems a crear, que debe ser mayor que  cero.
  # Los ítems creados se generan en estado disponible.
  post 'productos/:codigo/items', to: 'products#add_item'




  get 'reservas', to: 'reservations#index'
  get 'reservas/:id', to: 'reservations#show'
  post 'reservas', to: 'reservations#create'
  put 'reservas/:id/vender', to: 'reservations#sell'
  delete 'reservas/:id', to: 'reservatios#destroy'
  get 'ventas', to: 'sells#index'
  get 'ventas/:id', to: 'sells#show'
  post 'ventas', to: 'sells#create'

end
