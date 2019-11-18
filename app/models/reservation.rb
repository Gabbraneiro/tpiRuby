class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :reservation_detail

  validates :user, :client, presence: true
end
