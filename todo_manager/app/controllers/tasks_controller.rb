class TasksController < ApplicationController
	before_action :require_login
	before_action :set_user 
	
	def index
	end

	def new
		@task = Task.new
	end
	
	def create
		@task = @user.tasks.new(task_params)
		unless @task.save
			flash[:error] = "Task not saved! Task content can't be blank!"
		end
		redirect_to user_tasks_path
	end

	def edit
		@task = @user.tasks.find(params[:id])
	end

	def update
	  @task = @user.tasks.find(params[:id])

	  if @task.update(task_params)
	    redirect_to user_tasks_path
	  else
	    render 'edit'
	  end
	end

	def search #search uncompleted tasks by tag
		@tasks = @user.tasks.where("is_completed = false AND tag = ?", params[:tag])
	end

	def complete #mark an uncompleted task as complete
		@task = @user.tasks.find(params[:id])
		@task.is_completed = true
		@task.save
		redirect_to user_tasks_path
	end

	def view #view completed tasks
	end

	def undo #undo completed tasks
		@task = @user.tasks.find(params[:id])
		@task.is_completed = false
		@task.save
		redirect_to view_completed_path
	end

	def destroy
		@task = @user.tasks.find(params[:id])
		@task.destroy
		redirect_back(fallback_location: user_tasks_path)
	end
 
	private
	def require_login
		unless signed_in?
	    flash[:error] = "You must be signed in to view your to-do list."
	    redirect_to root_url # halts request cycle
	  end
	end
	
	def set_user 
		@user = current_user 
	end

	def task_params
      params.require(:task).permit(:content, :due_date, :tag, :priority_level, :is_completed)
  end
end

