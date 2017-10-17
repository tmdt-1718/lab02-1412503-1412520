class SessionController < ApplicationController
	def new
		render "index", layout: false
	end
	def create
		user = User.find_by_email(session_params[:email])
		if user.nil?
			render :new
		else
			if user.password == params[:pass]
				session[:current_user] = user
				redirect_to messages_path
			end
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
