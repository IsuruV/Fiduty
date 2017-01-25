class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :level_id
      t.integer :user_id
      t.string :task
    end
  end
end
