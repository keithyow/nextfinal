class TasksController < ApplicationController
	before_action :authorize

  def index
    if current_user != nil
      # @tasks = current_user.tasks
      if params[:term]
        @tasks = current_user.tasks.search_description(params[:term])
      else
        @tasks = current_user.tasks
      end

    end
  end

	def new
		
  end

  def create
    @task  = current_user.tasks.new(task_params)
    if @task.save
      # If list saves in the db successfully:
      respond_to do |format|

      # # if the response fomat is html, redirect as usual
        format.html { redirect_to root_path }

        format.js { }
      end
    else
      # If list failsto create:
      flash.now.alert = "Couldn't create task. Try again."
    end
  end

  def destroy
    @current = Task.find(params[:id])
    if @current.destroy
      redirect_to tasks_path
    else
      # If list failsto create:
      flash.now.alert = "Couldn't delete task. Try again."
    end
  end

  private

    def task_params
      params.require(:task).permit(:description, :address)
    end

end
