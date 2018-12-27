class YnabService

	def initialize(token)
		@token = token
		@_budget_id = nil
		@_category_id = nil
	end

	def snap_category(user)
		user.tracked_category
	end

	def budget_id
		@_budget_id
	end

	def get_uid
		info = get_json("/v1/user")
		id = info[:data][:user][:id]
	end

	def get_snapshot(user)
		info = get_json("/v1/budgets/#{snap_category(user).budget_id}/categories/#{snap_category(user).ynab_cid}")
		snapshot = info[:data][:category]
	end

	def get_categories
		@_budget_id ||= get_default_budget[:id]
		info = get_json("/v1/budgets/#{budget_id}/categories")[:data][:category_groups].third[:categories]
	end

	def get_default_budget
		info = get_json("/v1/budgets")
		budget = info[:data][:budgets].first
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