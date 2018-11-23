class User < ApplicationRecord
  before_create -> { self.auth_token = SecureRandom.hex }
  has_many :projects
  has_many :tasks
  has_many :comments
end
