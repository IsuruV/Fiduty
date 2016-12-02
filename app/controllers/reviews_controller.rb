class ReviewsController < ApplicationController
    def index
        @portfolio = Portfolio.find(params[:portfolio_id])
        respond_to do |format|
            format.json {render json: @portfolio.reviews}
        end
    end 
end
