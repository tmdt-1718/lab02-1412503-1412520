class InboxController < ApplicationController
	before_action :authenticate
	def index
		@messages = Inbox.find_by_recipient_id(current_user[:id])
		byebug
	end
end
