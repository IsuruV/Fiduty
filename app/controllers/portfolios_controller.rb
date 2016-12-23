class PortfoliosController < ApplicationController
    before_action :authenticate_user!

    def show
        @portfolio = Portfolio.find(params[:id])
     if @portfolio
        respond_to do |format|
            format.json {render json: @portfolio}
            format.html {render :show }
        end
     else
                 respond_to do |format|
            format.json {render json: {"error":"portfolio does not exist"} }
        end
     end

    end

    def create
    end

    def index
        @portfolios = Portfolio.all
        respond_to do |format|
            format.json {render json: @portfolios}
            format.html {render :index }

        end
    end

    def portfolios_by_type
        if params[:investment_type] && params[:type_of_fund]
            @portfolios = Portfolio.search_portfolios_by_criteria(params[:investment_type], params[:type_of_fund])
        elsif  params[:investment_type] && !params[:type_of_fund]
          @portfolios = Portfolio.search_portfolio_type_only(params[:investment_type])
        elsif !params[:investment_type] && params[:type_of_fund]
            @portfolios =  Portfolio.search_fund_type_only(params[:type_of_fund])
        else
            @portfolios = Portfolio.all
        end
        respond_to do |format|
            format.json {render json: @portfolios}
            format.html {render :index }
        end
    end

    def upload
        CsvParser.upload(params)
        redirect_to portfolios_path
    end
end
