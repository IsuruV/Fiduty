class TasksController < Api::ApiApplicationController
    before_action :authenticate_user!
    
    def users_tasks
        @tasks = current_user.user_tasks
        arr = []
        @tasks.each do |task|
            arr.push({"level_id":task.task.level.level, "task_id":task.task.id, "info":task.task.task, "completed":task.completed})
        end
          respond_to do |format|
            format.json {render json: arr}
          end
    end 
    
    def complete_task
    #   task_completed = params[:task_id].to_i
    # somethings up here 
        begin
        task_completed = JSON.parse(params.first[0])["task_id"]
        rescue
        task_completed = params[:task_id].to_i
        end
      complete = current_user.complete_task(task_completed)
      render json:{
        status: complete
      }
    end
    
    #     def show
    #         require 'pry'; binding.pry
    #     @task = current_user.user_tasks.where(id: params[:id].to_i).first
    #     respond_to do |format|
    #         format.json {render json: @task}
    #     end
    # end 
    def index
        respond_to do |format|
            format.json{render json: current_user.level.tasks}
        end
    end
    
    # private
    #     def user_params
    #      params.require(:task).permit(:id, :task_id, :level_id)
    #     end
end
