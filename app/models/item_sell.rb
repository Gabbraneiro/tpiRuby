class ItemSell < ApplicationRecord
  belongs_to :sell, foreign_key: "sell_id"
  belongs_to :item, foreign_key: "item_id"
  validates :sell, :item, presence: true
end
