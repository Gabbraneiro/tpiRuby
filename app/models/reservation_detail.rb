class ReservationDetail < ApplicationRecord
  belongs_to :product
  validates :product, presence: true
end
