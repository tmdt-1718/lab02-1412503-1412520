class SessionController < ApplicationController
	def new
		render "index", layout: false
	end
	def create
		user = User.find_by_email(session_params[:email])
		if user != nil
			if user.authenticate(session_params[:pass])
				login(user)
				redirect_to inbox_index_path
				return
			end
		end
		flash[:fail] = 'Wrong username or password'
		render "index", layout: false
	end
	def destroy
		logout
		redirect_to login_path
	end
	private
	def session_params
		params.require(:session).permit(:email, :pass)
	end
end
