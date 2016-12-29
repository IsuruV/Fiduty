class AddColumnToUserPortfoliosYtd < ActiveRecord::Migration[5.0]
  def change
    add_column :user_portfolios, :ytd, :float
  end
end
