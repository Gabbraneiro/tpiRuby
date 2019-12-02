class SellsController < PrivateController
  before_action :set_sell, only: [:show, :update, :destroy]

  # GET /ventas
  def index
    @sells = Sell.where(user: @current_user)
    render json: @sells
  end

  # GET /sells/1
  def show
    render json: @sell
  end

  # POST /sells
  def create
    @sell = Sell.new(sell_params)

    if @sell.save
      render json: @sell, status: :created, location: @sell
    else
      render json: @sell.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sells/1
  def update
    if @sell.update(sell_params)
      render json: @sell
    else
      render json: @sell.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sells/1
  def destroy
    @sell.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find(params[:id])
    end

    def sell_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
