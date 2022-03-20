class Message < ApplicationRecord
  
  validates :content, :operation_id, :user_id, presence: true 
  validates :content, length: { minimum: 30, maximum: 300 }
  
  
  belongs_to :operation
  belongs_to :user
end
