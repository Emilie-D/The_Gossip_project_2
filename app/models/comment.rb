class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :author, :class_name => 'User'
  validates :content, presence: true 
end
