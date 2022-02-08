class Resarvation < ApplicationRecord
  
  belongs_to :user
  
  belongs_to :room
  
  validates :start, presence: true
  validates :room_id, presence: true
  validates :end, presence: true
  validates :people, presence: true

end
