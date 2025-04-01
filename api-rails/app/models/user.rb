class User < ApplicationRecord
  has_one_attached :avatar
  belongs_to :company
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :board_users
  has_many :boards, through: :board_users
  has_many :list_users
  has_many :lists, through: :list_users
  has_many :task_users
  has_many :tasks, through: :task_users

  has_secure_password
end
