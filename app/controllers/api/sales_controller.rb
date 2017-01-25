class Api::SalesController < Api::ApiApplicationController
    def create
        portfolio_id = params[:portfolio_id]
        amount = params[:amount]
        current_user.sell_investment(amount, portfolio_id)
      render json:{
        status: 'transaction created'
      }
    end
end
# sudo service postgresql start
