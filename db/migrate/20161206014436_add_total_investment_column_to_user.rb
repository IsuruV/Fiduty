class AddTotalInvestmentColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :total_investments, :float
  end
end
