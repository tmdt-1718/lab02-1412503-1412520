class InboxController < ApplicationController
	before_action :authenticate

	def index
		@active_inbox = "active"
		@messages = Inbox.where(recipient_id: current_user[:id]).all.order(created_at: :asc)
		@messages.each do |message|
			if current_user.friends.find{|x| x.friend_id == message.message.sender_id} == nil
				message.isOfFriend = false
			else
				message.isOfFriend = true
			end
		end
	end

	def read
		@id = params[:id]

		if Inbox.update(params[:id], isRead: true)
			render :json => {:data => 'success'}
		else
			render :text => {:data => 'fail'}
		end
	end
end
