class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.integer :source_id, null: false
      t.integer :target_id, null: false
      t.string :state
      t.string :message

      t.timestamps
    end
  end
end
