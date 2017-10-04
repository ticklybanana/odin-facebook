class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.belongs_to :author, index: true

      t.timestamps
    end
  end
end
