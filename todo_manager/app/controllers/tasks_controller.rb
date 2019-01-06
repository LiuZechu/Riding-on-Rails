class TasksController < ApplicationController
	before_action :require_login

	def index
		@user = current_user
	    #@task = @user.tasks.create(task_params)
	    #(params[:task])
	end
  	
  	def edit
  		@user = current_user
  		@task = @user.tasks.find(params[:id])
  	end
	
	def create
		@user = current_user
	    @task = @user.tasks.create(task_params)
	    redirect_to user_tasks_path
  	end

	def update
		@user = current_user
	    @task = @user.tasks.find(params[:id])

	  if @task.update(task_params)
	    redirect_to user_tasks_path
	  else
	    render 'edit'
	  end
	end

  	def destroy
 		@user = current_user
	    @task = @user.tasks.find(params[:id])
	    @task.destroy
	    redirect_to user_tasks_path
  	end
 
  
	private
	  def require_login
		unless signed_in?
	      flash[:error] = "You must be signed in to view your to-do list."
	      redirect_to root_url # halts request cycle
	    end
	end

	def task_params
      params.require(:task).permit(:content, :due_date, :tag, :priority_level)
      #params.permit(:content, :due_date)
    end
end

