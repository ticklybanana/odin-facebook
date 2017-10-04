class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :author, index: true
      t.belongs_to :parent_comment, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
