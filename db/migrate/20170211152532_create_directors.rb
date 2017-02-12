class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :avatar
      t.string :name, null: false
      t.text :about
      t.integer :awards_awardee_count
      t.integer :movies_count
      t.timestamps null: false
    end
  end
end
