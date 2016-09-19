class CreateCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures do |t|
      t.string :type
      t.string :name
      t.string :skill
      t.integer :level
      t.integer :hp
      t.integer :at
      t.integer :df
      t.integer :exp
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
