class WelcomeController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "secret", only: :admin
  def index #initial page
  	render :layout => false
  end

  def admin #allows the admin to view all users and delete users
  	@users = User.all
  end
end
