class Label < ApplicationRecord
  belongs_to :color
  belongs_to :board
  has_many :label_tasks
  has_many :tasks, through: :label_tasks
end
