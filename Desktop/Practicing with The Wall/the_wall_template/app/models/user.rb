class User < ActiveRecord::Base

  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :location, presence: true
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

end
