class UserPortfoliosController < ApplicationController
    
    def create
       binding.pry
        @portfolio = Portfolio.find(params[:portfolio_id])
        UserPortfolio.find_or_create_by(user_id: current_user.id, portfolio_id: @portfolio.id)
              render json:{
        success: @portfolio
      }
    end
    
end
