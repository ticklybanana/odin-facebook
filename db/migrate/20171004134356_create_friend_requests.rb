class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.belongs_to :requester, index: true
      t.belongs_to :requested, index: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
