class UserController < ApplicationController
	# def new
	# 	render "session/index", layout: false
	# end
	before_action :authenticate, only: :index
	def index
		@users = User.where.not(id: current_user[:id])
		@users.each do |user|
			if user.friends.find{|x| x.friend_id == current_user[:id]} != nil
				user.isFriend = true
			else
				user.isFriend = false
			end
		end
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
		params.require(:user).permit(:email, :name, :password)
	end
end
