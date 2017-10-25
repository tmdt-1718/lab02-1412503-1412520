class NewMesController < ApplicationController
	before_action :authenticate
	def index		
		temp = current_user.id
		@users = User.select(User.arel_table[:email]).joins(
				  User.arel_table.join(Friend.arel_table).on(
				    Friend.arel_table[:user_id].eq(temp).and(
				      User.arel_table[:id].eq(Friend.arel_table[:friend_id])
				    ).or(
				      Friend.arel_table[:friend_id].eq(temp).and(
				        User.arel_table[:id].eq(Friend.arel_table[:user_id])
				      )
				    )
				  ).join_sources
				)
		@mes = "Please fill details to send a new message"
		@active_newmes = "color: red"
	end

	def create
		temp = current_user.id
		@mes = "Sent successfully"

		# file = File.open('new_mes_controller.log', File::WRONLY | File::APPEND | File::CREAT)
		# To create new (and to remove old) logfile, add File::CREAT like:
		# file = File.open('foo.log', File::WRONLY | File::APPEND | File::CREAT)
		# logger = Logger.new(file)
		# logger.level = Logger::DEBUG
		# logger.debug("do Create")

		re_list = (params[:newmes][:recipient])[0].split(',')
		# logger.debug(re_list)
		# logger.debug(re_list.class.name)
		mes_id = Message.create(content: params[:newmes][:content], sender_id: current_user.id, senttime: Time.now)
		if mes_id
			# mes_id = Message.select(Message.arel_table[:id]).where(Message.arel_table[:sender_id].eq(temp)).order(Message.arel_table[:id]).reverse_order.limit(1)
			re_list.each do |rec|
				# logger.debug(rec)
				Inbox.create(message_id: mes_id.id, isRead: false, recipient_id: User.find_by_email(rec).id)
			end			
		else
			@mes = "Sent failed"
		end

		@users = User.select(User.arel_table[:email]).joins(
				  User.arel_table.join(Friend.arel_table).on(
				    Friend.arel_table[:user_id].eq(temp).and(
				      User.arel_table[:id].eq(Friend.arel_table[:friend_id])
				    ).or(
				      Friend.arel_table[:friend_id].eq(temp).and(
				        User.arel_table[:id].eq(Friend.arel_table[:user_id])
				      )
				    )
				  ).join_sources
				)

		render "index"
	end

end


# User.select(User.arel_table[:email]).joins(
#   User.arel_table.join(Friend.arel_table).on(
#     Friend.arel_table[:user_id].eq(1).and(
#       User.arel_table[:id].eq(Friend.arel_table[:friend_id])
#     )
#   ).join_sources
# )