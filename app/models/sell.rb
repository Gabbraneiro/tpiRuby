class Sell < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :client, foreign_key: "client_id"
  belongs_to :reservation, foreign_key: "reservation_id"
  has_one :sell_details
  validates :user, :client, presence: true

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

  def add_sell_details(sell_details_params)
    sell_details_params.each do |sd|
      sell_detail = sell_details.create(sd)
      sell_detail.product.items_available.first(sd[:quantity]).each do |i|
        i.vendido!
        ItemSell.create({sell: self, item: i, date: Time.now})
      end
    end
  end

end
