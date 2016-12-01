class AdvisorSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  has_many :portfolios
end


