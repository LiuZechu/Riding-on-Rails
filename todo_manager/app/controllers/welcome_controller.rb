class WelcomeController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "secret", only: :admin
  def index
  end

  def admin
  	@users = User.all
  end
end
