class ApplicationController < ActionController::Base
 layout "application"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_filter :set_i18n_locale_from_params


	def set_i18n_locale_from_params 

	

			if params[:locale]
			if I18n.available_locales.include?(params[:locale].to_sym) 
						I18n.locale = params[:locale]
				else
					flash.now[:notice] ="#{params[:locale]} translation not available"
		          		logger.error flash.now[:notice]
				end 
			end
	end
end