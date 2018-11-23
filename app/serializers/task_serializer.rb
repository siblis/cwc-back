class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :deadline, :completed, :started, :project_id, :created_at, :updated_at
  belongs_to :user
end
