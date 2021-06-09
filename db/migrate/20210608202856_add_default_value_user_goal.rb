class AddDefaultValueUserGoal < ActiveRecord::Migration[6.0]
  def change
    change_column :user_goals, :current_amount, :integer, default: 0
  end
end
