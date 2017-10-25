class HomeController < ApplicationController
	before_action :authenticate, :disable_user_partial
	def index
		@active_home = "active"
	end

	def about
		@active_about = "active"
		render "about"
	end
end
