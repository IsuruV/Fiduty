class AddColumnTo < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :down_side_risk, :float
  end
end
