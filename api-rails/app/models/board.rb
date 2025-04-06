class Board < ApplicationRecord
  include SoftDestroy

  belongs_to :background, optional: true
  belongs_to :company
  has_many :board_users
  has_many :users, through: :board_users
  has_many :labels
  has_many :lists

  validates :name, presence: true
end
