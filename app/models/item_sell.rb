class ItemSell < ApplicationRecord
  belongs_to :sell
  validates :sell, presence: true
end
