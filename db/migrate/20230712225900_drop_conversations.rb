class DropConversations < ActiveRecord::Migration[7.0]
  def change
    drop_table :conversations do |t|
      t.integer :user1
      t.integer :user2
    end
  end
end
