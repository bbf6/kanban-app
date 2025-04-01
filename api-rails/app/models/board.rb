class Board < ApplicationRecord
  belongs_to :background
  belongs_to :company
  has_many :board_users
  has_many :users, through: :board_users
  has_many :labels
  has_many :lists
end
