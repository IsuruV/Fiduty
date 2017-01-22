class CreateUserPortfolioSales < ActiveRecord::Migration[5.0]
  def change
    create_table :user_portfolio_sales do |t|
      t.integer :sales_id
      t.integer :user_portfolios_id
    end
  end
end
