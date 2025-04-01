class Role < ApplicationRecord
  belongs_to :board
  has_many :user_roles
  has_many :users, through: :user_roles
  has_many :list_roles
  has_many :lists, through: :list_roles
end
