class User < ApplicationRecord
	has_many :gossips
	validates :first_name, :last_name, :description, :age, presence: true
	validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
	has_one :city
	has_many :comments
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
