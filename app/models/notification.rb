class Notification < ApplicationRecord
	belongs_to :category
	has_many :days

	validates_presence_of :category_id
	validates_presence_of :time

end