class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :asker, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.integer :status
      t.timestamps
    end
  end
end
