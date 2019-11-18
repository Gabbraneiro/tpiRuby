class User < ApplicationRecord
  validates :username, :password, presence: true
  validates :username, uniqueness: true
end
