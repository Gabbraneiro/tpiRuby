class ReservationsController < PrivateController
  before_action :set_reservation, only: [:show, :vender, :destroy]
  before_action :check_sold, only: [:vender]
  before_action :validate_params, only: [:create]

  # GET /reservas
  def index
    @reservations = Reservation.not_sold
    json_response(@reservations)
  end

  # GET /reservas/{id}
  def show
    json_response(@reservation)
  end

  # POST /reservas
  def create
    @reservation = Reservation.create(request_params.except(:reservation_details))
    @reservation.add_reservation_details(reservation_details_params)
    json_response(@reservation, :created)
  end

  # PUT /reservas/:id/vender
  def vender
    @reservation.update(sell: Sell.create_from_reservation(@reservation)) if !@reservation.sold?
    json_response(@reservation.sell, :created)
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
        json_response(nil, :not_found, {codigo: 'Reserva no encontrada'})
      end
    end

    def reservation_details_params
      request_params[:reservation_details].collect do |rd|
        {product: Product.find(rd[:product_id]), quantity: rd[:quantity]}
      end
    end

    def validate_params
      errors = {}
      validate_products(errors)
      validate_user(errors)
      validate_client(errors)
      validate_date(errors)
      json_response(nil, :bad_request, errors) unless errors.empty?
      return
    end

    def validate_products(errors)
      request_params[:reservation_details].collect do |rd|
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
        User.find(request_params[:user_id])
      rescue ActiveRecord::RecordNotFound
        errors[:user_id] = "No existe usuario con id #{request_params[:user_id]}"
      end
    end

    def validate_client(errors)
      begin
        Client.find(request_params[:client_id])
      rescue ActiveRecord::RecordNotFound
        errors[:client_id] = "No existe cliente con id #{request_params[:client_id]}"
      end
    end

    def validate_date(errors)
      begin
        f = request_params[:date].split('-')
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
    def check_sold
      json_response(nil, :bad_request, {reservation: "La reserva ya fue vendida"}) if @reservation.sold?
    end
end
