class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  belongs_to :post
  has_many :likes, as: :contentable
end
