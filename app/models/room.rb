class Room < ApplicationRecord
  belongs_to :user
  has_many :resarvations
  
  attachment :image
end
