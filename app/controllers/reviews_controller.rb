class ReviewsController < ApplicationController
    def index
        @portfolio = Portfolio.find(params[:portfolio_id])
        respond_to do |format|
            format.json {render json: @portfolio.reviews}
        end
    end 
    
    def create
        content = params[:content]
        rating = params[:rating]
        @portfolio = Portfolio.find(params[:portfolio_id])
        @portfolio.reviews.create(content: params[:content], rating: params[:rating])
        respond_to do |format|
            format.json {render json: @portfolio.reviews}
        end
    end
end
