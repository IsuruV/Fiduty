class ChangeColumnsUserPortfoliosSales < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_portfolio_sales, :sales_id, :sale_id
    rename_column :user_portfolio_sales, :user_portfolios_id, :user_portfolio_id
  end
end
