class Gossip < ApplicationRecord
	belongs_to :user
	validates :title, presence: true,  length: { in: 3..30 }
	validates :content, presence: true 
	has_many :comments
end
