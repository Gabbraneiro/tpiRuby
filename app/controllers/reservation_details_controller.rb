class ReservationDetailsController < ApplicationController
  before_action :set_reservation_detail, only: [:show, :update, :destroy]

  # GET /reservation_details
  def index
    @reservation_details = ReservationDetail.all

    render json: @reservation_details
  end

  # GET /reservation_details/1
  def show
    render json: @reservation_detail
  end

  # POST /reservation_details
  def create
    @reservation_detail = ReservationDetail.new(reservation_detail_params)

    if @reservation_detail.save
      render json: @reservation_detail, status: :created, location: @reservation_detail
    else
      render json: @reservation_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservation_details/1
  def update
    if @reservation_detail.update(reservation_detail_params)
      render json: @reservation_detail
    else
      render json: @reservation_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservation_details/1
  def destroy
    @reservation_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_detail
      @reservation_detail = ReservationDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_detail_params
      params.require(:reservation_detail).permit(:quantity)
    end
end
