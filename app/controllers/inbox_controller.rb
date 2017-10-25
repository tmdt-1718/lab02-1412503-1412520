class InboxController < ApplicationController
	before_action :authenticate

	def index
		@active_inbox = "active"
		@messages = Inbox.where(recipient_id: current_user[:id]).all.order(created_at: :asc)
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
