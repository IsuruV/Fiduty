class Change < ActiveRecord::Migration[5.0]
   def change
    change_column :users, :funds, :integer, :default => 1000
  end
end
