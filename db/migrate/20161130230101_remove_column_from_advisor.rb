class RemoveColumnFromAdvisor < ActiveRecord::Migration[5.0]
def self.up
    remove_column :advisors, :type
  end

  def self.down
    add_column :advisors, :type_of_fund, :string
  end
end
