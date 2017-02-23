class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX } 
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  has_many :songs, as: :tunes
  has_many :songlists
  has_many :musics, through: :songlists
end
