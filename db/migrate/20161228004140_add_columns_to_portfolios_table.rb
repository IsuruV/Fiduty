class AddColumnsToPortfoliosTable < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :alpha, :float
    add_column :portfolios, :meanAnnualReturn, :float
    add_column :portfolios, :rSquared, :float
    add_column :portfolios, :stdDev, :float
    add_column :portfolios, :sharpeRatio, :float
    add_column :portfolios, :treynorRatio, :float
  end
end
