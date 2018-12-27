class User < ApplicationRecord
	has_many :tokens
	has_many :categories

	validates_presence_of :name
	validates_presence_of :phone
	validates_presence_of :email
	validates_uniqueness_of :email

	def tracked_category
		self.categories.find_by(tracked: true)
	end

end
