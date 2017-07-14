class User < ApplicationRecord
  validates :wxuin, presence: true, uniqueness: true
  has_many :contacts
  has_many :messages
end
