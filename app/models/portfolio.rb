class Portfolio < ApplicationRecord
    belongs_to :advisor
    # has_one :advisor
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

        #    def self.search_portfolio_type_only(portfolio_type)
        #     Portfolio.where(investment_type: portfolio_type)
        #  end

      def self.destroy_nil_risk_portfolios
        errors = Portfolio.where(stdDev: 0.0, fund_type: 'ETF')
        errors.each do |error|
          Portfolio.destroy(error)
        end
      end


      def self.safety_net
        Portfolio.all.where('stdDev < 5')
      end

      def self.conservative
        Portfolio.all.where(' stdDev >= 5 AND stdDev <= 10')
      end

      def self.moderate
        Portfolio.all.where('stdDev > 10 AND std <= 30')
      end

      def self.aggressive
        Portfolio.all.where('stdDev > 30')
      end

      def self.search_portfolio_type_only(portfolio_type)
          if portfolio_type == 'safety_net'
            Portfolio.safety_net
          elsif portfolio_type == 'conservative'
            Portfolio.conservative
          elsif portfolio_type == 'moderate'
            Portfolio.moderate
          elsif portfolio_type == 'aggressive'
            Portfolio.aggressive
          end
      end

end
