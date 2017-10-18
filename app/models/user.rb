class User < ApplicationRecord
	has_secure_password
	# def pass
	# 	@pass = BCrypt::Password.new(self.password_hash)
	# end

	# def pass=(new_password)
	# 	@pass = BCrypt::Password.create(new_password)
	# 	self.password_hash = @pass
	# end
end
