class DropTableTableUserPortfliosSales < ActiveRecord::Migration[5.0]
  def change
    drop_table :table_user_portfolios_sales
  end
end
