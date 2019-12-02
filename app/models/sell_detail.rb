class SellDetail < ApplicationRecord
  belongs_to :product, foreign_key: "product_id"
  belongs_to :sell, foreign_key: "sell_id"
  validates :product, presence: true
end
