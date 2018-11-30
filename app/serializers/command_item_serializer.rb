class CommandItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :project
  has_one :user
  class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :title, :completed
  end
end
