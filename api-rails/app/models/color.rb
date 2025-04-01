class Color < ApplicationRecord
  has_many :labels
  has_many :lists
end
