class Task < ApplicationRecord
  belongs_to :project
  has_many :comments
  validates :title, presence: true
end
