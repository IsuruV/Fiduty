class UserPortfoliosController < ApiApplicationController
    before_action :authenticate_user!


    def create
      investment_amount = params[:investment_amount].to_f
      current_user.subtract_from_funds(investment_amount)
      @portfolio = Portfolio.find(params[:portfolio_id].to_i)
      # YahooApi.update_ytd(@portfolio)
      YahooApi.fetch_recent_price(@portfolio)
      weight = investment_amount / @portfolio.price
      # UserPortfolio.create(portfolio: @portfolio, trad_price: @portfolio.price, weight: weight, ytd: @portfolio.ytd_raw, inital_investment: investment_amount, user: current_user, investment_date: Time.now)
      current_user.user_portfolios.create(portfolio: @portfolio, trad_price: @portfolio.price, weight: weight, ytd: @portfolio.ytd_raw, inital_investment: investment_amount, investment_date: Time.now)
      respond_to do |format|
          format.json {render json: current_user.portfolios}
      end
    end

    def sell
      sell_amount = params[:sell_amount].to_f
      etf = params[:etf_id].to_i
      if current_user.sell_investment(sell_amount, etf)
        respond_to do |format|
          format.json{ render json: 'sold' }
        end
        else
          respond_to do |format|
            format.json{ render json: 'error' }
         end

      end
    end

    def recent_investments
      investments = UserPortfolio.recent_investments
      respond_to do |format|
        format.json {render json: investments.to_json}
      end
    end

    def user_portfolios
      current_user.users_portfolios
      respond_to do |format|
        format.json {render json: {"user_portfolios": current_user, "total_investment": current_user.calculate_total_investment, "total_value": current_user.user_total_value}}
      end
    end

end
