class CreateTableUserPortfoliosSales < ActiveRecord::Migration[5.0]
  def change
    create_table :table_user_portfolios_sales do |t|
      t.integer :user_portfolios_id
      t.integer :sales_id
    end
  end
end
