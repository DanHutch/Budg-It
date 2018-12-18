class User < ApplicationRecord
	has_many :tokens
	has_many :budgets


	# def initialize(data)
	# 	@name = data["name"]
	# 	@phone = data["phone"]
	# 	@email = data["email"]
	# end

end