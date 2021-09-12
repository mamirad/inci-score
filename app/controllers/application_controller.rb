class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	set_current_tenant_through_filter
  	before_action :set_tennant

  	def set_tennant
    	set_current_tenant(current_user)
  	end
end
