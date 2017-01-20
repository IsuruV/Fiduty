class ChangeColumnFundsUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :funds, :integer, :default => 100
  end
end
