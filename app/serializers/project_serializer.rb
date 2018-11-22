class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :deadline, :completed, :started, :created_at, :updated_at
  belongs_to :user
end