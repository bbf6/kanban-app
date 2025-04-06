class Background < ApplicationRecord
  include SoftDestroy

  belongs_to :company
  has_many :boards
  has_one_attached :image

  validates :name, presence: true
end
