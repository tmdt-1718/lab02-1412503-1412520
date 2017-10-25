class SentMesController < ApplicationController
	def index
		@messages = Message.find_by_sql("select distinct on (1) mes.id , mes.content, mes.senttime, users.email, mes.id, (select count(*) from inboxes inb1 where mes.id = inb1.message_id) as count_mes
										from messages mes, inboxes inb, users
										where mes.id = inb.message_id and users.id = inb.recipient_id and mes.sender_id = " + current_user.id.to_s + "
										order by mes.id desc
										")
		@active_sent = "active"
	end

	def get_recipient
		# file = File.open('log/recipient_controller.log', File::WRONLY | File::APPEND | File::CREAT)
		# To create new (and to remove old) logfile, add File::CREAT like:
		# file = File.open('foo.log', File::WRONLY | File::APPEND | File::CREAT)
		# logger = Logger.new(file)
		# logger.level = Logger::DEBUG
		# logger.debug("do Create")

		@recipients = Inbox.find_by_sql('select users.email, inboxes."isRead", inboxes.updated_at from inboxes, users where users.id = inboxes.recipient_id and inboxes.message_id = ' + params[:mes_id].to_s)

		# logger.debug('id= ' + params[:mes_id])
		# logger.debug(@recipients)

		respond_to do |format|
			msg = {
				:recipients => @recipients
			}
			format.json{ render :json => msg}
		end
	end 
end
