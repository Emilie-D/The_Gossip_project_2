class User < ApplicationRecord
	has_many :gossips
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :description, presence: true, length: { in: 10..500 }
	validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
	validates :age, presence: true
	has_one :city
	has_many :comments
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
