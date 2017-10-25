class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action { flash.clear }
  include SessionHelper


  def disable_user_partial
  	@disable_user_partial = true
  end
end
