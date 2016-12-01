class AdvisorsController < ApplicationController
    def new
    end
    
    def show
        @advisor = Advisor.find(params[:id])
        respond_to do |format|
            format.json {render json: @advisor}
            format.html {render :show }
        end 
    end
    
    def create
    end
    
    def index
        @advisors = Advisor.all
        respond_to do |format|
            format.json {render json: @advisors}
            format.html {render :index }
        end 
    end 
end
