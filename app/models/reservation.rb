class Reservation < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :client, foreign_key: "client_id"
  has_one :sell
  has_one :reservation_details
  validates :user, :client, presence: true

  def self.not_sold
    self.all.select{ |p| p.sell.nil? }
  end

  def add_reservation_details(reservation_details_params)
    reservation_details_params.each do |rd|
      reservation_detail = reservation_details.create(rd)
      reservation_detail.product.items_available.first(rd[:quantity]).each do |i|
        i.reservado!
        ItemReservation.create({reservation: self, item: i, date: Time.now})
      end
    end
  end

  def sold?
    !sell.nil?
  end

  def reservation_details
    ReservationDetail.where(reservation:self)
  end

  # def destroy
  #   ItemReservation.where(reservation: itself).each do |ir|
  #     ir.item.disponible!
  #     # ir.destroy
  #   end
  #   # ReservationDetail.where(reservation: itself).destroy_all
  #   super.destroy
  # end

end
