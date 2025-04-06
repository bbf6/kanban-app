class User < ApplicationRecord
  include SoftDestroy
  include RegexPatterns

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

  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX, message: 'you have an invalid email' }
  validates :password, length: { minimum: 10 }, format: { with: PASSWORD_REGEX, message: 'your password must have at least 1 letter, 1 uppercase and 1 digit' }
end
