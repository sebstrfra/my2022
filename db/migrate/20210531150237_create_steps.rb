class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.references :user_goal, null: false, foreign_key: true
      t.datetime :date
      t.integer :increment
      t.integer :accumulated_amount

      t.timestamps
    end
  end
end
