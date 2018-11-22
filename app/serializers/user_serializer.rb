class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :deleted
end