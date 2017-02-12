class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :tile, null: false
      t.text :desc
      t.integer :awards_awardee_count
      t.timestamps null: false
    end
  end
end
