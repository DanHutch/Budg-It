class User < ApplicationRecord
	has_many :tokens
	has_many :budgets

	validates_presence_of :name
	validates_presence_of :phone
	validates_presence_of :email
	validates_uniqueness_of :email

	def from_hash(data)
		@name = data["name"]
		@phone = data["phone"]
		@email = data["email"]
	end

end