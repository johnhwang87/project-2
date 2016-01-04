class User < ActiveRecord::Base

  has_secure_password
  has_many :instrument
  has_many :jam


  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
