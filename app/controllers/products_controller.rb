class ProductsController < PrivateController
  before_action :set_product, only: [:show, :add_item, :items]
  before_action :check_q, only: [:index]
  before_action :check_quantity, only: [:add_item]

  # GET /productos
  def index
    @products = Product.send(params[:q])
    render json: @products
  end

  # GET /productos/{codigo}/items
  def items
    render json: @product.items
  end

  # GET /productos/{codigo}
  def show
    render json: @product
  end

  # POST /productos/:codigo/items
  def add_item
    params[:_json].times { Item.create({product: @product, status: :disponible})}
    render json: @product.items, status: :created
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by_code(params[:codigo])
      respond_with_errors({codigo: 'Código de producto no encontrado'}, :not_found) if @product.nil?
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:code, :description, :detail, :price)
    end

    # En caso de que no se especifique un parametro "q" válido (['scarce', 'all','in_stock']) se setea "in_stock"
    def check_q
      params[:q] = 'in_stock' if !(['scarce', 'all','in_stock'].include? params[:q])
    end

    # En caso de que el body no tenga un numero valido mayor a 0, se retorna 400.
    def check_quantity
      errors = {cantidad: 'Debe enviar en el body una cantidad mayor a 0'}
      respond_with_errors(errors, :bad_request) #if (!params[:_json].is_a? Integer || !params[:_json] > 0)
    end
end
