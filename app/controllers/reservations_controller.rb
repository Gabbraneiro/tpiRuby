class ReservationsController < PrivateController

  before_action :set_reservation, only: [:show, :vender, :destroy]
  before_action :check_sold, only: [:vender, :destroy]
  before_action :validate_params, only: [:create]

  # GET /reservas
  def index
    @reservations = Reservation.not_sold
    render jsonapi: @reservations
  end

  # GET /reservas/{id}
  def show
    render jsonapi: @reservation, include: params[:include]
  end

  # POST /reservas
  def create
    @reservation = Reservation.create(request_params)
    render jsonapi: @reservation, status: :created
  end

  # PUT /reservas/:id/vender
  def vender
    @reservation.update(sell: Sell.create_from_reservation(@reservation))
    render jsonapi: @reservation.sell
  end

  # DELETE /reservas/:id
  def destroy
    @reservation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
        @reservation = Reservation.find(params[:id])
    end

    # Ejecuta siempre despues del set_reservation
    def check_sold
      @request = SellReservationRequest.new @reservation
      render jsonapi_errors: @request.errors, status: :bad_request if !@request.valid?
    end

    def validate_params
      @request = NewReservationRequest.new request_params
      render jsonapi_errors: @request.errors, status: :bad_request if !@request.valid?
    end

end
