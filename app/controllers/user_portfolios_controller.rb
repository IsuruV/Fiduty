class UserPortfoliosController < ApplicationController
    before_action :authenticate_user!


    def create
      investment_amount = params[:investment_amount].to_f
      @portfolio = Portfolio.find(params[:portfolio_id].to_i)
      YahooApi.update_ytd(@portfolio)
      UserPortfolio.create(portfolio: @portfolio, ytd: @portfolio.ytd_raw, user: current_user, inital_investment: investment_amount, investment_date: Time.now)
      respond_to do |format|
          format.json {render json: current_user.portfolios}
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
