class InboxController < ApplicationController
	before_action :authenticate
	def index
		@messages = Inbox.where(recipient_id: current_user[:id]).all
	end
end
