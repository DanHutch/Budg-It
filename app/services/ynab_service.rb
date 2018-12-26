class YnabService

	def initialize(token)
		@token = token
	end

	def get_uid
		info = get_json("/v1/user")
		id = info[:data][:user][:id]
	end

	def get_categories
		budget_id = get_budgets.first[:id]
		info = get_json("/v1/budgets/#{budget_id}/categories")[:data]
		binding.pry
	end

	def get_budgets
		info = get_json("/v1/budgets")
		budget = info[:data][:budgets]
	end

private

	def get_json(path)
		response = conn.get(path)
		JSON.parse(response.body, symbolize_names: true)
	end

	def conn
		Faraday.new(url: "https://api.youneedabudget.com") do |faraday|
			faraday.headers["Authorization"] = "Bearer #{@token}"
			faraday.adapter Faraday.default_adapter
		end

	end
end