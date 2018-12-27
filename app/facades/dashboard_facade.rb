class DashboardFacade

	def initialize(user)
		@user = user
		@_category_results = nil
		@_snapshot_results = nil
	end

	def user
		@user
	end

	def tracked_cat_name
		@user.tracked_category.name
	end

	def tracked_category
		@user.tracked_category
	end

	def category_count
		@user.categories.count
	end

	def username
		@user.name
	end

	def snapshot
		snap = Snapshot.new(snapshot_results)
	end

	def create_categories
		category_results.map do |cat_info|
		@user.categories.create({
				ynab_cid: 	cat_info[:id],
				name:				cat_info[:name],
				budget_id:	budget_id
			})
		end
	end

	def all_categories
		@user.categories
	end

private

	def snapshot_results
		@_snapshot_results ||= service.get_snapshot(@user)
	end

	def category_results
		@_category_results ||= service.get_categories
	end

	def budget_id
		@_service.budget_id
	end

	def service
	@_service ||=	YnabService.new(@user.tokens.last.token)
	end

end