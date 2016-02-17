class ItemSerializer < ActiveModel::Serializer
  attributes :id, :item, :completed, :list
end
