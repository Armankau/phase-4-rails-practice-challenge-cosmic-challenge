class MissionSerializer < ActiveModel::Serializer
  attributes :id, :name, :scientist, :planet
  has_one :scientist
  has_one :planet
end
