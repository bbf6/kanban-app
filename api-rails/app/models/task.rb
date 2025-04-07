class Task < ApplicationRecord
  include SoftDestroy

  has_rich_text :content
  belongs_to :list
  has_many :label_tasks
  has_many :labels, through: :label_tasks
  has_many :task_users
  has_many :users, through: :task_users

  validates :title, presence: true
  validates :description, presence: true, on: :create
  validates :content, presence: true, on: :create
  validates :index, presence: true

  before_validation :resume_content

  private

  def resume_content()
    self.description = self.content.to_plain_text[..500]
  end
end
