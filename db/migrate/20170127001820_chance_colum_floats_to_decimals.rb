# class ChanceColumFloatsToDecimals < ActiveRecord::Migration[5.0]
#   def change
    
#     change_column :portfolios, :open, :decimal, precision: 10, scale: 3
#     change_column :portfolios, :day_high, :decimal, precision: 10, scale: 3
#     change_column :portfolios, :day_low, :decimal, precision: 10, scale: 3
#     change_column :portfolios, :p_e, :decimal, precision: 10, scale: 3
#     change_column :portfolios, :beta, :decimal, precision: 10, scale: 3
    
#     change_column :sales, :amount, :decimal, precision: 10, scale: 3
    
#     change_column :user_portfolios, :gain_loss, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :account_value, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :transaction_fee, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :fiduty_fee, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :weight, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :trad_price, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :ytd, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :holding_return, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :value, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :dividends, :decimal, precision: 10, scale: 3
#     change_column :user_portfolios, :very_inital_investment, :decimal, precision: 10, scale: 3
    
#   end
# end

# # class ChangeTableFloat < ActiveRecord::Migration[5.0]
# #   def change
# #     change_table :user_portfolios do |t|
# #     t.decimal :account_value, precision: 10, scale: 3
# #     t.decimal :transaction_fee, precision: 10, scale: 3
# #     t.decimal :fiduty_fee, precision: 10, scale: 3
# #     t.decimal :weight, precision: 10, scale: 3
# #     t.decimal :trad_price, precision: 10, scale: 3
# #     t.decimal :ytd, precision: 10, scale: 3
# #     t.decimal :holding_return, precision: 10, scale: 3
# #     t.decimal :value, precision: 10, scale: 3
# #     t.decimal :dividends, precision: 10, scale: 3
# #     t.decimal :very_inital_investment, precision: 10, scale: 3
# #     end
# #   end
# # end


# class ChangeTableFloat < ActiveRecord::Migration[5.0]
#   def change
    
#     change_column :portfolios, :open, :decimal, precision: 6, scale: 3
#     change_column :portfolios, :day_high, :decimal, precision: 6, scale: 3
#     change_column :portfolios, :day_low, :decimal, precision: 6, scale: 3
#     change_column :portfolios, :beta, :decimal, precision: 6, scale: 3
    
#     change_column :sales, :amount, :decimal, precision: 6, scale: 3
    
#     change_column :user_portfolios, :gain_loss, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :account_value, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :transaction_fee, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :fiduty_fee, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :weight, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :trad_price, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :ytd, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :holding_return, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :value, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :dividends, :decimal, precision: 6, scale: 3
#     change_column :user_portfolios, :very_inital_investment, :decimal, precision: 6, scale: 3
    
#   end
# end