class CategoriesController < ApplicationController

	def update
		to_update = current_user.categories.find_by(ynab_cid: params["category"])
		to_update.update(tracked: true)
	end
end