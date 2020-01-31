class Reservation < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :client, foreign_key: "client_id"
  has_one :sell
  has_many :reservation_details
  validates :date, :user, :client, presence: true

  def self.create(hash)
    Reservation.transaction do
      r = super(hash.except(:reservation_details))
      r.add_reservation_details(hash[:reservation_details])
      r
    end
  end

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

end
