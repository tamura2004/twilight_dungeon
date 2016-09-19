class CreateDungeons < ActiveRecord::Migration[5.0]
  def change
    create_table :dungeons do |t|
      t.string :name
      t.integer :level
      t.integer :depth

      t.timestamps
    end
  end
end
