class FriendController < ApplicationController
	before_action :authenticate
	def index
		@friends = Friend.where(user_id: current_user[:id]).all
	end

	def create
		begin
			Friend.create(user_id: current_user[:id], friend_id: params[:friend_id])
			Friend.create(user_id: params[:friend_id], friend_id: current_user[:id])
		rescue => ex
		  logger.error ex.message
		end
		
	end

	def destroy
		begin
			Friend.where(:user_id => current_user.id).where(:friend_id => params[:id]).destroy_all
			Friend.where(:user_id => params[:id]).where(:friend_id => current_user.id).destroy_all
		rescue => ex
		  logger.error ex.message
		end
	end
end
