class ContactPhone < ApplicationRecord
  validates :phone, presence: true
  validates :phone, format: { with: /^\d+$/, message: "Debe contener solo números" }
end
