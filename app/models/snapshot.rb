class Snapshot

	attr_reader :name,
							:budgeted,
							:spent,
							:remaining

	def initialize(data)
		@name = data[:name]
		@budgeted = data[:budgeted]
		@spent = data[:activity]
		@remaining = data[:balance]
	end

end