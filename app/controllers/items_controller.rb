class ItemsController < ApplicationController
    before_action :set_product, only: [:index, :create]
    before_action :check_quantity, only: [:create]

    # GET /productos/{codigo}/items
    def index
      render jsonapi: @product.items
    end

    # POST /productos/:codigo/items
    def create
      request_params[:quantity].to_i.times { Item.create({product: @product, status: :disponible})}
    end

    private

        def set_product
          @product = Product.find_by_code(params[:product_id])
          json_response(nil, :not_found, errors = {codigo: 'Código de producto no encontrado'}) if @product.nil?
        end

        # En caso de que el body no tenga un numero valido mayor a 0, se retorna 400.
        def check_quantity
          if (request_params[:quantity].to_s.match(/^\d+$/).nil?)
            json_response(nil, :bad_request, {cantidad: 'Debe enviar un número natural cuantitativo.'})
          end
          # Luego se hace un times do sobre Integer request_params[:quantity],
          # que en caso de ser cero no se hará
        end
end
