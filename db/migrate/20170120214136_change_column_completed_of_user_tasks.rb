class ChangeColumnCompletedOfUserTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :user_tasks, :completed, :boolean, :default => false
  end
end


