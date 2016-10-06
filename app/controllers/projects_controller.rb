class ProjectsController < ApplicationController

before_action :authenticate_user!

	def index
		@project = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
  	end
  	
  	def create
  		@project = Project.new(project_params)
  	
  		@project.save
  		redirect_to @project
  	end
  	 
private
	def project_params
		params.require(:project).permit(:name, :summary, :start_date, :end_date)
	end	 

end
