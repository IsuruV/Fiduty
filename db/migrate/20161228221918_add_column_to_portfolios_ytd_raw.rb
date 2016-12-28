class AddColumnToPortfoliosYtdRaw < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :ytd_raw, :float
  end
end
