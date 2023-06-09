class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  has_many :messages

  validates :user1, presence: true
  validates :user2, presence: true
end
