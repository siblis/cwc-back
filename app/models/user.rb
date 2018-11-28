class User < ApplicationRecord
  before_create -> { self.auth_token = SecureRandom.hex }
  has_many :projects
  has_many :tasks
  has_many :tasks, class_name: "task", foreign_key: "doer_id"
  has_many :comments
  has_many :command_items, class_name: "command_item", foreign_key: "command_id"
  has_many :mprojects, class_name: "project", through: :command_items
end
