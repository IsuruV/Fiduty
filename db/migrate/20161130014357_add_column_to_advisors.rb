class AddColumnToAdvisors < ActiveRecord::Migration[5.0]
  def change
    add_column :advisors, :type, :string
  end
end
