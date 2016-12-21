class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
     respond_to do |format|
       format.json {render json: @user}
     end
   end
   
  def add_user_info
    if current_user.id = params[:id]
      @user = User.find(params[:id])
      @user.update(user_params)
      render :json => @user
    else
      render json:{
        error: "Unauthorized access", status: 403
      }
    end
  end
  

  private
  def user_params
    params.require(:user).permit(:id, :risk_level, :phone, :action,
    :martial_status, :dependants, :citizenship, :dob, :ssn, :address)
  end
end
