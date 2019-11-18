class Item < ApplicationRecord
  enum status: [:disponible, :reservado, :vendido]
  has_one :item_reservation
  has_one :item_sell
  belongs_to :product
  validates :product, presence: true
end
