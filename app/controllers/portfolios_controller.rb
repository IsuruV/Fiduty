class PortfoliosController < ApplicationController
    before_action :authenticate_user!
        def new
    end
    
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
    
    def upload
        CSV.foreach(params[:leads].path, headers: true) do |row|
            @advisor = Advisor.create(type_of_fund: row[1], name: row[2], address: row[4])
           @advisor.portfolios.create(open: row[10], day_high: row[11], day_low: row[12], volume: row[13], week_52: row[16], ytd: row[17], avg_1: row[19],
                            avg_3: row[20], avg_5: row[21], market_cap: row[22], p_e: row[23], beta: row[24], description: row[29], investment_type: row[30],
                            fund_type: row[3], down_side_risk: row[28])
        end
        redirect_to portfolios_path
  end
end
