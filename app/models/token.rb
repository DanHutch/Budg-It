class Token < ApplicationRecord
	belongs_to :user

	validates_presence_of :token
	validates_presence_of :user_id
	validates_presence_of :refresh_token

end