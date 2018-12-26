class DashboardFacade

	def initialize(user)
		@user = user
		@_category_results = nil
	end

	def username
		@user.name
	end

	def categories
		category_results.map do |category_info|
			Category.new(category_info)
		end
	end

private

	def category_results
		@_category_results ||= service.get_categories
	end

	def service
		YnabService.new(@user.tokens.last)
	end

end