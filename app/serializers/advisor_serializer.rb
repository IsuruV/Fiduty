class AdvisorSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :type_of_fund
  has_many :portfolios
end


