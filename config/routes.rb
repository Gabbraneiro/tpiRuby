Rails.application.routes.draw do

    # Usuarios
    resources :users, only:[:create], path: 'usuarios'

    # Sesiones
    post 'sesiones', to: 'authentication#authenticate'

    # Productos
    resources :products, only: [:index, :show], path: 'productos' do
          resources :items, only: [:index, :create]
    end

    # Reservas
    resources :reservations, only: [:index, :show, :create, :destroy], path: 'reservas'do
        member {put :vender}
    end

    # Ventas
    resources :sells, only:[:index, :show, :create], path: 'ventas'

end
