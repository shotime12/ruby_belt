class Music < ApplicationRecord
  belongs_to :user
  has_many :users, through: :songlists
  validates :artist, length: { minimum: 2 }
  validates :title, length: { minimum: 2 }
end
