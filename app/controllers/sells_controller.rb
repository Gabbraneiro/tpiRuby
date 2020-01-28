class SellsController < PrivateController
  before_action :set_sell, only: [:show, :update, :destroy]
  before_action :validate_params, only: [:create]

  include Marketable

  # GET /ventas
  def index
    @sells = Sell.where(user: @current_user)
    render jsonapi: @sells
  end

  # GET /ventas/1
  def show
    render jsonapi: @sell
  end

  # POST /ventas
  def create
    @sell = Sell.create(request_params.except(:sell_details))
    @sell.add_sell_details(marketable_details_params(request_params, 'sell'))
    render jsonapi: @sell, status: :created
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find_by({user:@current_user, id: params[:id]})
      json_response(nil, :not_found, {codigo: 'Venta no encontrada'}) if @sell.nil?
    end

    def validate_params
      errors = {}
      validate_marketable_params(request_params, 'sell')
      json_response(nil, :bad_request, errors) unless errors.empty?
      return
    end
end
