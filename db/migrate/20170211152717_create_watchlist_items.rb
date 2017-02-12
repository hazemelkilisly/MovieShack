class CreateWatchlistItems < ActiveRecord::Migration
  def change
    create_table :watchlist_items do |t|
      t.belongs_to :user
      t.belongs_to :movie
      t.timestamps null: false
    end
  end
end
