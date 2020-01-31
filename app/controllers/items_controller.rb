class ItemsController < ApplicationController

    before_action :set_product, only: [:index, :create]
    before_action :check_quantity, only: [:create]

    # GET /productos/{codigo}/items
    def index
      render jsonapi: @product.items
    end

    # POST /productos/:codigo/items
    def create
      @request.quantity.to_i.times { Item.create({product: @product, status: :disponible})}
    end

    private

      def set_product
          @product = Product.find_by!({code: params[:product_id]})
      end

      def check_quantity
        @request = AddItemsRequest.new request_params
        render jsonapi_errors: @request.errors, status: :bad_request if !@request.valid?
      end
end
