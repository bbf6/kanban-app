class BoardUser < ApplicationRecord
  belongs_to :board
  belongs_to :user
  has_many :roles
end
