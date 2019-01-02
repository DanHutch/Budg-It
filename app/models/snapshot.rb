class Snapshot

	attr_reader :name,
							:budgeted,
							:spent,
							:remaining

	def initialize(data)
		@name = data[:name]
		@budgeted = data[:budgeted].to_f / 1000
		@spent = data[:activity].to_f / 1000
		@remaining = data[:balance].to_f / 1000
	end

	def daily_allotment
		today = Date.today.day
		end_of_month = Date.today.end_of_month.day
		(@remaining / (end_of_month - today)).round(2)
	end

end
