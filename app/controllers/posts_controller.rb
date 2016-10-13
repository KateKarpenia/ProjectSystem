class PostsController < ApplicationController

	def index
      @posts = current_user.posts
    end



	def create
		@project = Project.find(params[:project_id])
		@post = @project.posts.create(post_params)
		
		# @user = User.find(params[:user_id])
# 		@post = @user.posts.create(post_params)
		
		redirect_to project_path(@project)
	end
	
	def destroy
		@project = Project.find(params[:project_id])
		@post = @project.posts.find(params[:id])
		@post.destroy
		redirect_to project_path(@project)
	end
	
	
	private
		def post_params
			params.require(:post).permit(:content)
		end


end
