class User < ActiveRecord::Base

  has_secure_password
  has_many :jams
  has_many :comments
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
