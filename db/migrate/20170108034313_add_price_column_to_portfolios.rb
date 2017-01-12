class AddPriceColumnToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :price, :float
  end
end
