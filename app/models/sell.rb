class Sell < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :reservation
  has_many :sell_detail
  validates :user, :client, presence: true
end
