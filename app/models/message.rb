class Message < ApplicationRecord
  belongs_to :operation
  belongs_to :user
end
