class AddColumnToAdvisors2 < ActiveRecord::Migration[5.0]
  def change
    add_column :advisors, :type_of_fund, :string
  end
end
