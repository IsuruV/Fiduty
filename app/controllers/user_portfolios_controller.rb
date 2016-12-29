class UserPortfoliosController < ApplicationController
    before_action :authenticate_user!

    # def create
    #     @portfolio = Portfolio.find(params[:portfolio_id])
    #       UserPortfolio.create(portfolio: @portfolio, user: current_user, inital_investment: params[:investment_amount], shares: params[:shares], investment_date: Time.now)
    #     if current_user.total_investments
    #         current_user.total_investments += params[:investment_amount].to_i
    #     else
    #         current_user.total_investments = 0
    #         current_user.total_investments += params[:investment_amount].to_i
    #     end
    #       current_user.save
    #     respond_to do |format|
    #         format.json {render json: current_user.portfolios}
    #     end
    # end

    def create
      @portfolio = Portfolio.find(params[:portfolio_id])
      wei = params[:investment_amount].to_i / @portfolio.return_price.to_i
      YahooApi.update_ytd(@portfolio)
      UserPortfolio.create(portfolio: @portfolio, ytd: @portfolio.ytd_raw, user: current_user, inital_investment: params[:investment_amount], shares: params[:shares], investment_date: Time.now, weight: wei )
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
