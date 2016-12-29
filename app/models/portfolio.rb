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

     def self.portfolios_index_page_formated(advisor_type)
       portfolios = Portfolio.search_portfolio_type_only(advisor_type)
       portfolios_formatted = []
       portfolios.each do |portfolio|
         portfolios_formatted.push({'advisor_id': portfolio.advisor.id,'symbol': portfolio.symbol, 'portfolioID': portfolio.id, 'portfolioName': portfolio.name,
                                    'portfolioSymbol': portfolio.symbol, 'fundType': portfolio.fund_type,
                                    'roi': portfolio.ytd_raw, 'ratingTotal': portfolio.reviews.average(:rating)
                                    })
       end
       portfolios_formatted
     end

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

      def self.filter_by(portfolio_type, filter)
        portfolios = Portfolio.search_portfolio_type_only(portfolio_type)
        if filter == 'reviews'
          portfolios.reviews.order('rating desc')
        elsif filter == 'return'
          portfolios.order('ytd_raw desc')
        end
      end

      def real_time_quotes
        YahooApi.real_time_quotes(self.symbol)
      end

      # def total_value(current_user)
      #   YahooApi.update_ytd(self)
      #   transactions = UserPortfolio.where(user_id: current_user.id, portfolio_id: self.id)
      #   transactions.map do |transaction|
      #     transaction.weight = (self.ytd_raw - transaction.ytd) * transaction.inital_investment
      #     transaction.save
      #   end
      #   transactions.each do |transaction|
      #     sum += transaction.weight
      #   end
      #   sum
      # end
      #
      # def holding_return(current_user)
      #   YahooApi.update_ytd(self)
      #   transactions = UserPortfolio.where(user_id: current_user.id, portfolio_id: self.id)
      #   transactions.map do |transaction|
      #     transaction.weight = (self.ytd_raw - transaction.ytd)
      #     transaction.save
      #   end
      #   transactions.each do |transaction|
      #     sum += transaction.weight
      #   end
      #   sum
      # end

end
