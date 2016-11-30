class CreateUserPortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :user_portfolios do |t|
      t.integer :user_id
      t.integer :portfolio_id
      t.float :inital_investment
      t.integer :shares
      t.float :gain_loss
      t.float :account_value
      t.string :investment_date
      t.string :datetime

      t.timestamps
    end
  end
end
