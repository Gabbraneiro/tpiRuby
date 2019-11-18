class ItemSellsController < ApplicationController
  before_action :set_item_sell, only: [:show, :update, :destroy]

  # GET /item_sells
  def index
    @item_sells = ItemSell.all

    render json: @item_sells
  end

  # GET /item_sells/1
  def show
    render json: @item_sell
  end

  # POST /item_sells
  def create
    @item_sell = ItemSell.new(item_sell_params)

    if @item_sell.save
      render json: @item_sell, status: :created, location: @item_sell
    else
      render json: @item_sell.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_sells/1
  def update
    if @item_sell.update(item_sell_params)
      render json: @item_sell
    else
      render json: @item_sell.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_sells/1
  def destroy
    @item_sell.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_sell
      @item_sell = ItemSell.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_sell_params
      params.require(:item_sell).permit(:date)
    end
end
