class AddStartDateToChallenge < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :start_date, :date
  end
end
