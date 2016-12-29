class AddColumnToUserPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :user_portfolios, :weight, :float
  end
end
