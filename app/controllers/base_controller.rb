class BaseController < ApplicationController

 before_action :authorize , :set_i18n_locale_from_params

    protected
        def authorize
           	if !session[:user_id]
           		redirect_to new_session_path
        	end
    	end


  before_filter :set_i18n_locale_from_params


	def set_i18n_locale_from_params 

		puts "this method excute every time"

			if params[:locale]

				session[:locale]="param"
		puts session[:locale]
				session[:locale]=params[:locale]
				if I18n.available_locales.include?(params[:locale].to_sym) 
						I18n.locale = params[:locale]
				else
					flash.now[:notice] ="#{params[:locale]} translation not available"
		          		logger.error flash.now[:notice]
				end 
			end
	end
 end
