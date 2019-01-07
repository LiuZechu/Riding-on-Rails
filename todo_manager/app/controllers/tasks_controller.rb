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

	def complete
		@user = current_user
	    @task = @user.tasks.find(params[:id])
	    @task.is_completed = true
	    @task.save
	    redirect_to user_tasks_path
	end

	def view #view completed tasks
		@user = current_user
	end

	def undo
		@task = current_user.tasks.find(params[:id])
		@task.is_completed = false
		@task.save
		redirect_to view_completed_path
	end

  	def destroy
 		@user = current_user
	    @task = @user.tasks.find(params[:id])
	    @task.destroy
	    #redirect_to user_tasks_path
	    redirect_back(fallback_location: user_tasks_path)
  	end
 
	private
	  def require_login
		unless signed_in?
	      flash[:error] = "You must be signed in to view your to-do list."
	      redirect_to root_url # halts request cycle
	    end
	end

	def task_params
	  #params.permit(:content, :due_date, :tag, :priority_level, :is_completed)
      params.require(:task).permit(:content, :due_date, :tag, :priority_level, :is_completed)
      #params.permit(:content, :due_date)
    end
end

