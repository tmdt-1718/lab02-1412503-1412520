class SessionController < ApplicationController
	def new
		render "register/index", layout: false
	end
	def create
		user = User.find_by(session_params)
		if user.nil?
			render :new
		else
			session[:current_user] = user
			redirect_to messages_path
		end
	end
	def destroy
		session.delete(:current_user)
		redirect_to login_path
	end
	private
	def session_params
		params.require(:session).permit(:email, :pass)
	end
end
