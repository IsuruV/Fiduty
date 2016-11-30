class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :portfolio_id
      t.string :content
      t.timestamps
    end
  end
end
