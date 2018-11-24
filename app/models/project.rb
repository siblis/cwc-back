class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :title, presence: true
  validates :user_id, presence: true
end
