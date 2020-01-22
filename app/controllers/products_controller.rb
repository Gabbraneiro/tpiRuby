class ProductsController < PrivateController
  before_action :set_product, only: [:show]
  before_action :check_q, only: [:index]

  # GET /productos
  def index
    @products = Product.send(params[:q])
    json_response(@products)
  end

  # GET /productos/{codigo}
  def show
    # test = {content_type: request.headers["Content-Type"], accept: request.headers["accept"]}
    json_response(@product)
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
    
end
