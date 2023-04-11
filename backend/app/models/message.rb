class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :content, presence: true
  validates :sender, presence: true
  validates :recipient, presence: true
end
