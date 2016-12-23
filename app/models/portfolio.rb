class Portfolio < ApplicationRecord
    belongs_to :advisor
    has_many :user_portfolios
    has_many :users, :through => :user_portfolios
    has_many :reviews
    
    def self.search_portfolios_by_criteria(portfolio_type, advisor_type)
        portfolios_sorted = []
        Portfolio.where(investment_type: portfolio_type).each do |portfolio|
            if portfolio.advisor.type_of_fund == advisor_type
                portfolios_sorted.push(portfolio)
            end
        end 
        portfolios_sorted
    end
    
      def self.search_fund_type_only(advisor_type)
          portfolios_sorted = []
        Portfolio.all.each do |portfolio|
            if portfolio.advisor.type_of_fund == advisor_type
                portfolios_sorted.push(portfolio)
            end
        end
        portfolios_sorted
     end
     
           def self.search_portfolio_type_only(portfolio_type)
            Portfolio.where(investment_type: portfolio_type)
         end
    
end
