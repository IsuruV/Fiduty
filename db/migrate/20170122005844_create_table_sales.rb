class CreateTableSales < ActiveRecord::Migration[5.0]
  def change
    create_table :table_sales do |t|
      t.float :amount
    end
  end
end
