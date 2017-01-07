class AddColumnDividendToUserPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :user_portfolios, :dividends, :float
  end
end
