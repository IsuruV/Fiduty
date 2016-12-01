class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :fund_type, :investment_type, :description, :open, :day_high, :day_low, :volume, :week_52, :avg_1, :avg_3, :avg_5,
             :market_cap, :p_e, :beta, :description
  has_one :advisor
  has_many :users
end


