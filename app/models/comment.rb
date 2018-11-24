class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :body, presence: true
  validates :user_id, presence: true
  validates :task_id, presence: true
end
