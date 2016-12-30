class AddColumnToPortfoliosYield < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :yield, :float
  end
end
