class BaseController < ApplicationController

 before_action :authorize

    protected
        def authorize
           	if !session[:user_id]
           		redirect_to new_session_path
        	end
    	end

 end
