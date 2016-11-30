class Portfolio < ApplicationRecord
    belongs_to :advisor
    has_many :user_portfolios
    has_many :users, :through => :user_portfolios
end
