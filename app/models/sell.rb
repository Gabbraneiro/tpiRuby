class Sell < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :client, foreign_key: "client_id"
  belongs_to :reservation, foreign_key: "reservation_id"
  validates :user, :client, presence: true

  def client_denomination
    client.denomination
  end

  def total_price
    sell_details.collect{ |rd| rd.product.price}.inject :+
  end

  def self.create_from_reservation(reservation)
    params = Hash.new
    params.store(:date, Date.today)
    params.store(:user, reservation.user)
    params.store(:client, reservation.client)
    params.store(:reservation, reservation)
    sell = self.create(params)
    sell.add_sell_details_from_reservation(reservation)
    sell
  end

  def add_sell_details_from_reservation(reservation)
    reservation.reservation_details.each do |rd|
      sell_detail = SellDetail.create({sell: itself, product: rd.product, quantity: rd.quantity})
      ItemReservation.where(reservation: reservation).each do |ir|
        ir.item.vendido!
        ItemSell.create({sell: itself, item: ir.item, date: Time.now})
      end
    end
  end

  def sell_details
    SellDetail.where(sell: itself)
  end
end
