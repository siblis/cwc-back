class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :deadline, :completed, :started, :project_id, :created_at, :updated_at, :npos
  belongs_to :user
  belongs_to :doer, class_name: "User"
end
