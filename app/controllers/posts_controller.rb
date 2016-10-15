class PostsController < ApplicationController

	def index
      # @posts = current_user.posts
#       @posts = Post.all

	if params[:project_id]
		@post = Project.find(params[:project_id]).posts
	elsif params[:project_id]
		@posts = User.find(params[:project_id]).posts
	else
		@posts = Post.all
	end
		
    
    end

	# def show
# 		@user = User.find(current_user)
# 		@post = @user.posts.find(params[:id])
# 	end

	def create
		@project = Project.find(params[:project_id])
		@user = User.find(current_user)
		@post = @project.posts.create(post_params)
		if @post.save
		redirect_to project_path(@project)
		end
		# @user = User.find(params[:user_id])
# 		@post = @user.posts.create(post_params)
# 		redirect_to projects_path
		
	end
	
	def destroy
		@project = Project.find(params[:project_id])
		@post = @project.posts.find(params[:id])
		@post.destroy
		redirect_to project_path(@project)
	end
	
	
	private
		def post_params
			params.require(:post).permit(:content, :user_id, :project_id)
		end


end
