class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :poster
      t.text :about
      t.boolean :featured, default: false
      t.string :name, null: false
      t.date :release_date, null: false
      t.string :rating, null: false
      t.string :trailer_url
      t.integer :movies_actors_count
      t.integer :movies_genres_count
      t.integer :news_count
      t.integer :reviews_count
      t.integer :watchlist_items_count
      t.integer :awards_awardee_count
      t.timestamps null: false
    end
  end
end
