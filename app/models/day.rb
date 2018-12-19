class Day < ApplicationRecord
	belongs_to :notification

	validates_presence_of :notification_id
	validates_presence_of :day

end