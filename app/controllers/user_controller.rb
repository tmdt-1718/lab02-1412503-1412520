class UserController < ApplicationController
	def new
		render "session/index", layout: false
	end

	def create
		if User.create(register_params)
			flash[:success] = 'User created successfully'
		else
			flash[:fail] = 'There must be something wrong'
		end
	end

	private
	def register_params
		params.require(:user).permit(:email, :name, :pass)
	end
end
