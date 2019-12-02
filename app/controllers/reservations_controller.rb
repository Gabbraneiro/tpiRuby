class ReservationsController < PrivateController
  before_action :set_reservation, only: [:show, :vender, :destroy]
  before_action :check_sell, only: [:destroy]
  before_action :validate_params, only: [:create]

  # GET /reservas
  def index
    @reservations = Reservation.not_sold
    render json: @reservations
  end

  # GET /reservas/{id}
  def show
    render json: @reservation
  end

  # POST /reservas
  def create
    @reservation = Reservation.create(reservation_params.except(:reservation_details))
    @reservation.add_reservation_details(reservation_details_params)
    render json: @reservation, status: :created
  end

  # PUT /reservas/:id/vender
  def vender
    @reservation.update(sell: Sell.create_from_reservation(@reservation)) if !@reservation.sold?
    render json: @reservation, status: :created
  end

  # DELETE /reservas/:id
  def destroy
    # @reservation.destroy if !@reservation.sold?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      begin
        @reservation = Reservation.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        respond_with_errors({codigo: 'Reserva no encontrada'}, :not_found)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def reservation_details_params
      reservation_params[:reservation_details].collect do |rd|
        {product: Product.find(rd[:product_id]), quantity: rd[:quantity]}
      end
    end

    def validate_params
      errors = {}
      validate_products(errors)
      validate_user(errors)
      validate_client(errors)
      validate_date(errors)
      respond_with_errors(errors, :bad_request) if !errors.empty?
      return
    end

    def validate_products(errors)
      reservation_params[:reservation_details].collect do |rd|
        messages = []
        begin
          validate_availability(Product.find(rd[:product_id]), rd[:quantity])
        rescue ActiveRecord::RecordNotFound
          messages.push("No existe producto con id #{rd[:product_id]}")
        rescue ActiveRecord::RecordNotFound, NoStockException, InvalidQuantityException  => e
          messages.push("#{e.message(rd[:product_id])}")
        ensure
          errors[:reservation_details] = messages if !messages.empty?
        end
      end
    end

    def validate_user(errors)
      begin
        User.find(reservation_params[:user_id])
      rescue ActiveRecord::RecordNotFound
        errors[:user_id] = "No existe usuario con id #{reservation_params[:user_id]}"
      end
    end

    def validate_client(errors)
      begin
        Client.find(reservation_params[:client_id])
      rescue ActiveRecord::RecordNotFound
        errors[:client_id] = "No existe cliente con id #{reservation_params[:client_id]}"
      end
    end

    def validate_date(errors)
      begin
        f = reservation_params[:date].split('-')
        Time.new(f[0], f[1], f[2])
      rescue
        errors[:date] = "Fecha inválida. Formato permitido: Y-m-d"
      end
    end

    def validate_availability(product, quantity)
        raise InvalidQuantityException if quantity < 1
        raise NoStockException if product.items_available.size < quantity
    end

    # Ejecuta siempre despues del set_reservation
    def check_sell
      respond_with_errors({reservation: "No puede eliminar una reserva que ya fue vendida"}, :bad_request) if @reservation.sold?
    end
end
