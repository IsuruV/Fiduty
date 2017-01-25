class Api::ReviewsController < Api::ApiApplicationController
    before_action :authenticate_user!
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
        @portfolio.reviews.create(content: content, rating: rating, user: current_user)
        respond_to do |format|
            format.json {render json: @portfolio}
        end
    end
end
