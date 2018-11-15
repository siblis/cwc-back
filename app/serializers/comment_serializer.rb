class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :task_id
end
