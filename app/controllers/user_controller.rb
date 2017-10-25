class UserController < ApplicationController
	# def new
	# 	render "session/index", layout: false
	# end
	before_action :authenticate, only: :index
	def index
		@active__user = "active"
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
		begin
			if !User.find_by_email(register_params[:email]).nil?
				render json: { data: '0' }
			else
				User.create(register_params)
				render json: { data: '1' }
			end
			redirect_to 'sesssion/index'
		rescue => ex
			flash[:fail] = ex.message
			# flash[:fail] = 'There must be something wrong'
		end
	end

	private
	def register_params
		params.require(:user).permit(:email, :name, :password)
	end
end
