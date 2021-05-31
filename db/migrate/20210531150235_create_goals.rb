class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.references :challenge, null: false, foreign_key: true
      t.string :name
      t.integer :target_amount
      t.string :unit
      t.integer :goal_type

      t.timestamps
    end
  end
end
