class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  has_many :requests_sent, class_name: 'FriendRequest', foreign_key: 'requester_id'
  has_many :requests_received, class_name: 'FriendRequest', foreign_key: 'requested_id'
  
  has_many :active_friends, -> { where friend_requests: { accepted: true } }, class_name: 'User', through: :requests_sent, source: :requested
  has_many :passive_friends, -> { where friend_requests: { accepted: true } }, class_name: 'User', through: :requests_received, source: :requester
end
