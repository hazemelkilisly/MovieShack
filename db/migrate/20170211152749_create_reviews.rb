class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rate, null: false
      t.text :comment, null: false
      t.timestamps null: false
    end
  end
end
