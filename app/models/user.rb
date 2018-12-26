class User < ApplicationRecord
	has_many :tokens
	has_many :categories

	validates_presence_of :name
	validates_presence_of :phone
	validates_presence_of :email
	validates_uniqueness_of :email

	# after_create do
	#   UserTexter.welcome(self).deliver
  # end
end
