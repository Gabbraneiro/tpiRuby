class ReservationsController < PrivateController
  before_action :set_reservation, only: [:show, :vender, :destroy]
  before_action :check_sold, only: [:vender]
  before_action :validate_params, only: [:create]

  include Marketable

  # GET /reservas
  def index
    @reservations = Reservation.not_sold
    render jsonapi: @reservations
  end

  # GET /reservas/{id}
  def show
    render jsonapi: @reservation
  end

  # POST /reservas
  def create
    @reservation = Reservation.create(request_params.except(:reservation_details))
    @reservation.add_reservation_details(marketable_details_params(request_params, 'reservation'))
    render jsonapi: @reservation, status: :created
  end

  # PUT /reservas/:id/vender
  def vender
    @reservation.update(sell: Sell.create_from_reservation(@reservation)) if !@reservation.sold?
    render jsonapi: @reservation.sell
  end

  # DELETE /reservas/:id
  def destroy
    @reservation.destroy unless @reservation.sold?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      begin
        @reservation = Reservation.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        json_response(nil, :not_found, {reservation: 'Reserva no encontrada'})
      end
    end

    # Ejecuta siempre despues del set_reservation
    def check_sold
      json_response(nil, :bad_request, {reservation: "La reserva ya fue vendida"}) if @reservation.sold?
    end

    def validate_params
      errors = validate_marketable_params(request_params, 'reservation')
      json_response(nil, :bad_request, errors) unless errors.empty?
      return
  end

end
