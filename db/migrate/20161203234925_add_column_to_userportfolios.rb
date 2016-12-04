class AddColumnToUserportfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :user_portfolios, :transaction_fee, :float
    add_column :user_portfolios, :fiduty_fee, :float
  end
end
