class RegisterController < ApplicationController
	# skip_before_action :verify_authenticity_token
	def index
		render layout: false
	end

	def create
		User.create(register_params)
	end

	private
	def register_params
		params.require(:user).permit(:email, :name, :pass)
	end
end
