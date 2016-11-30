class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :fund_type
      t.float :open
      t.float :day_high
      t.float :day_low
      t.string :volume
      t.string :week_52
      t.string :ytd
      t.string :avg_1
      t.string :avg_3
      t.string :avg_5
      t.string :market_cap
      t.string :p_e
      t.float  :beta
      t.text :description
      t.timestamps
    end
  end
end
