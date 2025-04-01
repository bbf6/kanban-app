class Company < ApplicationRecord
  has_many :backgrounds
  has_many :boards
  has_many :users
  has_one_attached :avatar
end
