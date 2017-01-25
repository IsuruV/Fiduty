class DropTableSales < ActiveRecord::Migration[5.0]
  def change
    drop_table :table_sales
  end
end
