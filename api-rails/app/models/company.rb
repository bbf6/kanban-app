class Company < ApplicationRecord
  include SoftDestroy

  has_many :backgrounds
  has_many :boards
  has_many :users
  has_one_attached :avatar

  validates :name, presence: true
end
