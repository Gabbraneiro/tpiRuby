class ContactPhone < ApplicationRecord
  validates :phone, presence: true
  validates :phone, format: { with: /\A\d+\z/, message: "Debe contener solo números" }
end
