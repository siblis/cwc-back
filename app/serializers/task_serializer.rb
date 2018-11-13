class TaskSerializer < ActiveModel::Serializer
  attributes :id
  attributes :id, :title, :body, :deadline, :completed, :started, :project_id, :created_at, :updated_at
end
