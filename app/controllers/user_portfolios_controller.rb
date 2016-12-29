class UserPortfoliosController < ApplicationController
    before_action :authenticate_user!

    def create
        @portfolio = Portfolio.find(params[:portfolio_id])
          UserPortfolio.create(portfolio: @portfolio, user: current_user, inital_investment: params[:investment_amount], shares: params[:shares], investment_date: Time.now)
        if current_user.total_investments
            current_user.total_investments += params[:investment_amount].to_i
        else
            current_user.total_investments = 0
            current_user.total_investments += params[:investment_amount].to_i
        end
          current_user.save
        respond_to do |format|
            format.json {render json: current_user.portfolios}
        end

    end
end
