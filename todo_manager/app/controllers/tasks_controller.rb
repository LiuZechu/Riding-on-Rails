class TasksController < ApplicationController
	before_action :require_login

	def index
	end

	def new
	end

	private
	  def require_login
		unless signed_in?
	      flash[:error] = "You must be signed in to view your to-do list."
	      redirect_to root_url # halts request cycle
	    end
	end
end

