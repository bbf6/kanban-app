class Background < ApplicationRecord
  belongs_to :company
  has_many :boards
  has_one_attached :image
end
