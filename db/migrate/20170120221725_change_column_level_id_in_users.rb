class ChangeColumnLevelIdInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :level_id, :integer, :default => 1
  end
end
