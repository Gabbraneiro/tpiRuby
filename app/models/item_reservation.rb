class ItemReservation < ApplicationRecord
  belongs_to :reservation, foreign_key: "reservation_id"
  belongs_to :item, foreign_key: "item_id"
  validates :reservation, :item, presence: true
end
