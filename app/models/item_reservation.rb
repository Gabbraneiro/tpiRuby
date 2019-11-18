class ItemReservation < ApplicationRecord
  belongs_to :reservation
  validates :reservation, presence: true
end
