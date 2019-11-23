class ProductsController < PrivateController
  before_action :set_product, only: [:show]
  before_action :check_q, only: [:index]

  # GET /productos
  def index
    @products = Product.send(params[:q])
    render json: @products
  end

  # GET /productos/{codigo}/items
  def items
    items = @product.items.collect { |i| {estado: i.status, valor: @product.amount} }
    render json: items
  end

  # GET /productos/{codigo}
  def show
    render json: @product
  end

  # POST /productos/:codigo/items
  def add_item
    # if params[:_json].is_a? Integer && params[:_json] > 0
    # @product = Product.find_by_code(params[:codigo])
    #
    #
    # if @product.save
    #   render json: @product, status: :created, location: @product
    # else
    #   render json: @product.errors, status: :unprocessable_entity
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by_code(params[:codigo])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:code, :description, :detail, :amount)
    end

    # En caso de que no se especifique un parametro "q" válido (['scarce', 'all','in_stock']) se setea "in_stock"
    def check_q
      params[:q] = 'in_stock' if !(['scarce', 'all','in_stock'].include? params[:q])
    end
end
