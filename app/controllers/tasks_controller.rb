class TasksController < ApplicationController
    before_action :authenticate_user!
    
    def users_tasks
        @tasks = current_user.user_tasks
        respond_to do |format|
            format.json {render json: @tasks}
        end
    end 
    
    def show
        @task = current_user.task.where(id: params[:id]).first
        respond_to do |format|
            format.json {render json: @task}
        end
    end 
    
    def complete_task
      task_completed = params[:task_id].to_i
      complete = current_user.complete_task(task_completed)
      render json:{
        status: complete
      }
    end
  
end