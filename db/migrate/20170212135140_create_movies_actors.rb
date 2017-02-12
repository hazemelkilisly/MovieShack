class CreateMoviesActors < ActiveRecord::Migration
  def change
    create_table :movies_actors do |t|

      t.timestamps null: false
    end
  end
end
