class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.integer :user1, null: false, foreign_key: true
      t.integer :user2, null: false, foreign_key: true

      t.timestamps
    end
    add_index :conversations, %i[user1 user2], unique: true
  end
end
