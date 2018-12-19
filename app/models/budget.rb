class Budget < ApplicationRecord
	belongs_to :user
	has_many :categories

	validates_presence_of :user_id
	validates_presence_of :ynab_bid
	validates_presence_of :name

end