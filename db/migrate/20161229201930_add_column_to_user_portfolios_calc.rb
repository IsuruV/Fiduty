class AddColumnToUserPortfoliosCalc < ActiveRecord::Migration[5.0]
  def change
    add_column :user_portfolios, :holding_return, :float
    add_column :user_portfolios, :value, :float
  end
end
