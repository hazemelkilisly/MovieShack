class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.integer :movies_genres_count
      t.timestamps null: false
    end
  end
end
