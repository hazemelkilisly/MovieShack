class CreateAwardsAwardees < ActiveRecord::Migration
  def change
    create_table :awards_awardees do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :awardee, polymorphic: true
      t.timestamps null: false
    end
  end
end
