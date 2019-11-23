class ItemReservationsController < PrivateController
  before_action :set_item_reservation, only: [:show, :update, :destroy]

  # GET /item_reservations
  def index
    @item_reservations = ItemReservation.all

    render json: @item_reservations
  end

  # GET /item_reservations/1
  def show
    render json: @item_reservation
  end

  # POST /item_reservations
  def create
    @item_reservation = ItemReservation.new(item_reservation_params)

    if @item_reservation.save
      render json: @item_reservation, status: :created, location: @item_reservation
    else
      render json: @item_reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_reservations/1
  def update
    if @item_reservation.update(item_reservation_params)
      render json: @item_reservation
    else
      render json: @item_reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_reservations/1
  def destroy
    @item_reservation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_reservation
      @item_reservation = ItemReservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_reservation_params
      params.require(:item_reservation).permit(:date)
    end
end
