class TeamsController < ApplicationController

before_action :authenticate_user!
before_action :admin_user,     only: [:create, :destroy, :edit, :update]

def index
    @team = Team.all
  end

def show
    @team =  Team.find(params[:id])
#    @users = @team.users
    @team_members = @team.users
#    @user = current_user.users.build if signed_in?
	
	
	
end

def new
		@team = Team.new
  	end
  	
def edit
		@team = Team.find(params[:id])
	end

def create
  @team = Team.new(team_params)
  if @team.save
  	redirect_to @team
  else
  	render 'new'
  end
  
end

def update
  		@team = Team.find(params[:id])
  		
  		if @team.update(team_params)
  			redirect_to @team
  		else
  			render 'edit'
  		end
  	end
  	
def destroy
  		@team = Team.find(params[:id])
  		@team.destroy
  		
  		redirect_to teams_path
  	end

private

	def team_params
		params.require(:team).permit(:name)
	end
	
	def current_user?(user)
    user == current_user
  end
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
