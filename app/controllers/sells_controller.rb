class SellsController < PrivateController

  before_action :set_sell, only: [:show, :update, :destroy]
  before_action :validate_params, only: [:create]

  # GET /ventas
  def index
    @sells = Sell.where(user: @current_user)
    render jsonapi: @sells
  end

  # GET /ventas/1
  def show
    render jsonapi: @sell, include: params[:include]
  end

  # POST /ventas
  def create
    @sell = Sell.create(request_params)
    render jsonapi: @sell, status: :created
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find_by!({user:@current_user, id: params[:id]})
    end

    def validate_params
      @request = NewSellRequest.new request_params
      render jsonapi_errors: @request.errors, status: :bad_request if !@request.valid?
    end
end
