class ProductsController < PrivateController
  before_action :set_product, only: [:show, :add_item, :items]
  before_action :check_q, only: [:index]
  before_action :check_quantity, only: [:add_item]

  # GET /productos
  def index
    @products = Product.send(params[:q])
    json_response(@products)
  end

  # GET /productos/{codigo}/items
  def items
    json_response(@product.items)
  end

  # GET /productos/{codigo}
  def show
    json_response(@product)
  end

  # POST /productos/:codigo/items
  def add_item
    request_params[:quantity].to_i.times { Item.create({product: @product, status: :disponible})}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by_code(params[:codigo])
      json_response(nil, :not_found, errors = {codigo: 'Código de producto no encontrado'}) if @product.nil?
    end

    # En caso de que no se especifique un parametro "q" válido (['scarce', 'all','in_stock']) se setea "in_stock"
    def check_q
      params[:q] = 'in_stock' if !(['scarce', 'all','in_stock'].include? params[:q])
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
