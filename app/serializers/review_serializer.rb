class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating
  has_one :portfolio
end
