class TasksController < ApplicationController
	before_action :authorize
	respond_to :html, :js

	def new
		@task = Task.new
  	end

  	def create
    	@task  = Task.create(task_params)
  	end

  private

    def task_params
      params.require(:task).permit(:description)
    end

end
