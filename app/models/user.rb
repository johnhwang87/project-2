class User < ActiveRecord::Base

  has_secure_password
  has_many :jams
  has_many :comments


  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
