class List < ApplicationRecord
  include SoftDestroy

  belongs_to :color
  belongs_to :board
  has_many :list_roles
  has_many :roles, through: :list_roles
  has_many :list_users
  has_many :users, through: :list_users
  has_many :tasks

  validates :title, presence: true
  validates :index, presence: true
end
