class WelcomeController < ApplicationController
  def index

  	@name=session[:user_name]
  	 @name
  end
end
