class UserPortfolioSerializer < ActiveModel::Serializer
  attributes :investment_amount, :shares, :investment_date
  has_many :users
  has_many :portfolios
end
