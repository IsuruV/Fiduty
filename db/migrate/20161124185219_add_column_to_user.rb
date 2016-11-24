class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :risk_level, :string
    add_column :users, :phone, :string
    add_column :users, :action, :string
    add_column :users, :martial_status, :string
    add_column :users, :dependants, :string
    add_column :users, :citizenship, :string
    add_column :users, :occupation, :string
    add_column :users, :dob, :string
    add_column :users, :ssn, :string
    add_column :users, :address, :string
  end
end
