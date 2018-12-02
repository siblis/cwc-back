class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :doer, class_name: "User", required: false, foreign_key: "doer_id"
  has_many :comments
  validates :title, presence: true
  validates :project_id, presence: true
end
