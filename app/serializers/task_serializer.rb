class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :state
end
