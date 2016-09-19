class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :dungeon, foreign_key: true
      t.integer :depth
      t.integer :score

      t.timestamps
    end
  end
end
