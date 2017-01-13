class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id].to_i)
     respond_to do |format|
       format.json {render json: @user.portfolio_with_vals}
     end
  end

  def index
    @users = User.portfolios_with_vals
    respond_to do |format|
      format.json {render json: @users}
    end
  end

  def add_user_info
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @user.update(user_params)
      render json:{
        user: @user.portfolio_with_vals
       }
    else
      render json:{
        error: "Unauthorized access", status: 403
        }
    end
end

   def user_portfolios
      current_user.users_portfolios
      begin
      # gain = current_user.calculate_total_investment - current_user.user_total_value
        gain = current_user.user_gain
      respond_to do |format|
        format.json {render json: {"user_info": current_user, "total_investment": current_user.calculate_total_investment,
                                    "total_value": current_user.user_total_value,
                                    "gain": gain, "user_portfolios": current_user.portfolio_with_vals
                                    }
                      }
      end
      rescue
          respond_to do |format|
            format.json {render json: {"user_portfolios": current_user.portfolio_with_vals, "total_investment": current_user.calculate_total_investment,
                                        "total_value": current_user.calculate_total_investment
                                        }
                          }
        end
      end
    end

    def recent_friend_investment
      fb_ids = params[:fb_ids]
      @users = User.recent_friend_investment(fb_ids)
      respond_to do |format|
        format.json {render json: @users}
      end
    end

    def recent_everyone_investment
      @users = User.everyone_investment
      respond_to do |format|
        format.json {render json:  @users}
      end
    end

    def add_funds
      amount = params[:funds].to_f
      current_user.funds = amount
      current_user.save
      respond_to do |format|
        format.json {render json: current_user}
      end
    end


  private
  def user_params
    params.require(:user).permit(:id, :risk_level, :phone, :action,
    :martial_status, :dependants, :citizenship, :dob, :ssn, :address, :fb_id, :email, :name, :password, :funds)
  end
end
