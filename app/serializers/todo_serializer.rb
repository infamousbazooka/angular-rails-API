class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :updated_at
end
