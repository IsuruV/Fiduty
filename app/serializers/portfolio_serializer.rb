class PortfolioSerializer < ActiveModel::Serializer

  attributes :id, :fund_type, :investment_type, :name, :symbol, :description, :ytd, :ytd_raw, :avg_1, :beta, :alpha, :meanAnnualReturn, :rSquared, :stdDev, :sharpeRatio, :treynorRatio, :user_portfolios, :reviews
  has_one :advisor
end


# attributes :id, :fund_type, :investment_type, :name, :symbol, :description, :open, :day_high, :day_low, :volume, :week_52, :avg_1, :avg_3, :avg_5,
#            :market_cap, :p_e, :beta, :alpha, :meanAnnualReturn, :rSquared, :stdDev, :sharpeRatio, :treynorRatio, :reviews, :user_portfolios, :reviews
