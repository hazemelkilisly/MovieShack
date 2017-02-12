class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :avatar
      t.string :name, null: false
      t.text :about
      t.integer :movies_actors_count
      t.integer :awards_awardee_count
      t.timestamps null: false
    end
  end
end
