class Room < ApplicationRecord
  
  belongs_to :user
  has_many :resarvations
  
 
  
  attachment :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true
  
end
