class User < ApplicationRecord
	attr_accessor :isFriend
	has_secure_password

	has_many :friends, foreign_key: "user_id", class_name: "Friend"
	# def pass
	# 	@pass = BCrypt::Password.new(self.password_hash)
	# end

	# def pass=(new_password)
	# 	@pass = BCrypt::Password.create(new_password)
	# 	self.password_hash = @pass
	# end
end