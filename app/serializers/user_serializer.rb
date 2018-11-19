class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :deleted
end