class FriendController < ApplicationController
	before_action :authenticate
	def index
		@friends = Friend.where(user_id: current_user[:id]).all
	end

	def create
		
	end

	def destroy
		Friend.where(:user_id => current_user.id).where(:friend_id => params[:id]).destroy_all
		Friend.where(:user_id => params[:id]).where(:friend_id => current_user.id).destroy_all
	end
end
