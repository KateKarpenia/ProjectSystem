class ProjectsController < ApplicationController

before_action :authenticate_user!
before_action :admin_user,     only: [:create, :destroy, :edit, :update]

	def index
		@project = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
  	end
  	
  	def edit
		@project = Project.find(params[:id])
	end
  	
  	def create
  		@team = Team.find(params[:team_id])
  		@project = @team.projects.create(project_params)
  	if @project.save
  			redirect_to team_path(@team)
  		else
  			render 'new'
  		end
  		 
  		
  
  	end
  	
  	def update
  		@project = Project.find(params[:id])
  		
  		if @project.update(project_params)
  			redirect_to @project
  		else
  			render 'edit'
  		end
  	end
  	
  	def destroy
  		@project = Project.find(params[:id])
  		@project.destroy
  		
  		redirect_to projects_path
  	end
  	 
private
	def project_params
		params.require(:project).permit(:name, :summary, :start_date, :end_date)
	end	 
	
	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
