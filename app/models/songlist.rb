class Songlist < ApplicationRecord
  belongs_to :user
  belongs_to :music 
  

end
