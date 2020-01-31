class ProductsController < PrivateController
  before_action :set_product, only: [:show]
  before_action :check_q, only: [:index]

  # GET /productos
  def index
    render jsonapi: Product.send(params[:q])
  end

  # GET /productos/{codigo}
  def show
    render jsonapi: @product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by!({code: params[:id]})
    end

    # En caso de que no se especifique un parametro "q" válido (['scarce', 'all','in_stock']) se setea "in_stock"
    def check_q
      params[:q] = 'in_stock' if !(['scarce', 'all','in_stock'].include? params[:q])
    end

end
