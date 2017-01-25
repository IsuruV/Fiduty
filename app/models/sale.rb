class Sale < ApplicationRecord
    has_many :user_portfolio_sales
    has_many :user_portfolios, :through => :user_portfolio_sales
end