class Task < ApplicationRecord
  has_rich_text :content
  belongs_to :list
  has_many :label_tasks
  has_many :labels, through: :label_tasks
  has_many :task_users
  has_many :users, through: :task_users
end
