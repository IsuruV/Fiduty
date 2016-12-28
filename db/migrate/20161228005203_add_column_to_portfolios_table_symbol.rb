class AddColumnToPortfoliosTableSymbol < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :symbol, :string
  end
end
