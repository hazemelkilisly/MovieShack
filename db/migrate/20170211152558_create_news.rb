class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :tile, null: false
      t.text :desc, null: false
      t.timestamps null: false
    end
  end
end
