class YnabService

	def initialize(token)
		@token = token
	end

	def get_uid
		info = get_json("/v1/user")
		id = info[:data][:user][:id]
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