class AddColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :user_portfolio_sales, :created_at, :datetime, null: false
    add_column :user_portfolio_sales, :updated_at, :datetime, null: false
    add_column :sales, :created_at, :datetime, null: false
    add_column :sales, :updated_at, :datetime, null: false
  end
end
