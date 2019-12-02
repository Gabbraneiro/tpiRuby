class ReservationDetail < ApplicationRecord
  belongs_to :product, foreign_key: "product_id"
  belongs_to :reservation, foreign_key: "reservation_id"
  validates :product, presence: true
end
