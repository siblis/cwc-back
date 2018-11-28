class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :owners, class_name: "User", through: :command_items
  validates :title, presence: true
  validates :user_id, presence: true
end
