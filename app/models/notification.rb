class Notification < ApplicationRecord
	belongs_to :category
	has_many :days

end