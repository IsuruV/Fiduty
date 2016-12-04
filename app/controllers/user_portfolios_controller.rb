class UserPortfoliosController < ApplicationController
    before_action :authenticate_user!
    def create
      
        @portfolio = Portfolio.find(params[:portfolio_id])
          UserPortfolio.create(portfolio: @portfolio, user: current_user, inital_investment: params[:investment_amount], shares: params[:shares], investment_date: Time.now)
        respond_to do |format|
            format.json {render json: current_user.portfolios}
        end 

    end
    
end
