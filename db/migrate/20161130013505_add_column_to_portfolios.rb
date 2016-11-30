class AddColumnToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :advisor_id, :integer
    add_column :portfolios, :investment_type, :string
  end
end
