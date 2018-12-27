class Category < ApplicationRecord
	belongs_to :user
	has_many :notifications

	validates_presence_of :ynab_cid
	validates_presence_of :name
	validates_presence_of :budget_id
end