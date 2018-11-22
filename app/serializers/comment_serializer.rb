class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :task_id
  belongs_to :user
end
