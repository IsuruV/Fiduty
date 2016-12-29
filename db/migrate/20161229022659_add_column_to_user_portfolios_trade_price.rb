class AddColumnToUserPortfoliosTradePrice < ActiveRecord::Migration[5.0]
  def change
    add_column :user_portfolios, :trad_price, :float
  end
end
