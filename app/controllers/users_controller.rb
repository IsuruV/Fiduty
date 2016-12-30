class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
     respond_to do |format|
       format.json {render json: @user}
     end
  end

  def add_user_info
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @user.update(user_params)
      respond_to do |format|
        format.json {render json: @user}
      end
    else
      render json:{
        error: "Unauthorized access", status: 403
      }
    end
  end

   def user_portfolios
   
      current_user.users_portfolios
      begin 
      gain = current_user.calculate_total_investment - current_user.user_total_value
      respond_to do |format|
        format.json {render json: {"user_info": current_user, "total_investment": current_user.calculate_total_investment, "total_value": current_user.user_total_value, "gain": gain, "user_portfolios": current_user.portfolio_with_vals}}
      end
      
      rescue
      
          respond_to do |format|
            format.json {render json: {"user_portfolios": current_user.portfolio_with_vals, "total_investment": current_user.calculate_total_investment, "total_value": current_user.calculate_total_investment}}
        end
        
      end 
    
    end



  private
  def user_params
    params.require(:user).permit(:id, :risk_level, :phone, :action,
    :martial_status, :dependants, :citizenship, :dob, :ssn, :address, :fb_id, :email, :name, :password)
  end
end
