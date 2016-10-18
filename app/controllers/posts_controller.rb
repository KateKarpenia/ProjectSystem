class PostsController < ApplicationController

	def index
      # @posts = current_user.posts
      @posts = Post.all

	# if params[:project_id]
	# 	@post = Project.find(params[:project_id]).posts
	# elsif params[:user_id]
	# 	@posts = User.find(params[:user_id]).posts
	# else
	# 	@posts = Post.all
	# end
		
    
    end

	# def show
# 		@user = User.find(current_user)
# 		@post = @user.posts.find(params[:id])
# 	end


	def create

		@project = Project.find(params[:project_id])


		@post = @project.posts.build(post_params.merge(:user => current_user))

		# @post = @project.posts.create(post_params)
		# @post.user = current_user
		
		if @post.save
		redirect_to project_path(@project)
		end
		
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
