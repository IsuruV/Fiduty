class UserPortfolioSale < ApplicationRecord
    belongs_to :user_portfolio
    belongs_to :sale
end