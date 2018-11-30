class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :doer, class_name: "User", foreign_key: "doer_id"
  has_many :comments
  validates :title, presence: true
  validates :user_id, presence: true
  validates :project_id, presence: true
end
