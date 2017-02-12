class CreateMoviesGenres < ActiveRecord::Migration
  def change
    create_table :movies_genres do |t|
      t.belongs_to :movie
      t.belongs_to :genre
      t.timestamps null: false
    end
  end
end
