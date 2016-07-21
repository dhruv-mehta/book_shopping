class WelcomeController < BaseController
  def index

  	@user=Admin.order(:name)

  end
end
