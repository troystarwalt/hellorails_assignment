class User < ActiveRecord::Base

	def self.serach(search)
		where("username LIKE ?", "%#{search}%")
		# where("email LIKE ?", "%#{search}%")
	end
end
