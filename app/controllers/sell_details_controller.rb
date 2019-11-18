class SellDetailsController < ApplicationController
  before_action :set_sell_detail, only: [:show, :update, :destroy]

  # GET /sell_details
  def index
    @sell_details = SellDetail.all

    render json: @sell_details
  end

  # GET /sell_details/1
  def show
    render json: @sell_detail
  end

  # POST /sell_details
  def create
    @sell_detail = SellDetail.new(sell_detail_params)

    if @sell_detail.save
      render json: @sell_detail, status: :created, location: @sell_detail
    else
      render json: @sell_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sell_details/1
  def update
    if @sell_detail.update(sell_detail_params)
      render json: @sell_detail
    else
      render json: @sell_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sell_details/1
  def destroy
    @sell_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_detail
      @sell_detail = SellDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sell_detail_params
      params.require(:sell_detail).permit(:quantity)
    end
end
