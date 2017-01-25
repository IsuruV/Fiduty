class AddColumnsToUserPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :user_portfolios, :active, :boolean, :default => true
    add_column :user_portfolios, :very_inital_investment, :float, :default => 0.00
  end
end
