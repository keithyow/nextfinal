class ListsController < ApplicationController
	before_action :authorize

	def index
		if current_user != nil
			@lists = current_user.lists
		end
	end

	def create
	    @list = current_user.lists.new(list_params)
	    if @list.save
		  # If list saves in the db successfully:
		  # flash[:notice] = "List created successfully!"
		  respond_to do |format|
		  # # if the response fomat is html, redirect as usual
		  	format.html { redirect_to root_path }

		  	format.js { }
		  end
		  # render json {@list}
		else
		  # If list failsto create:
		  flash.now.alert = "Couldn't create list. Try again."
		end
	end

	def edit
	end

	def destroy
		@current = List.find(params[:id])
		if @current.destroy
			respond_to do |format|
				format.html { redirect_to root_path }

				format.js {}
			end
		else
		  # If list failsto create:
		  flash.now.alert = "Couldn't delete list. Try again."
		end
	end

private
	def list_params
		params.require(:list).permit(:title)
	end
end
