class UsersController < ApplicationController

	before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: :destroy

def index
    # @user = User.all
    @users = User.paginate(page: params[:page], :per_page => 10)

  end

def show
    @user = User.find(params[:id])
    # @posts = current_user.posts
    @post = Post.where(:user_id => current_user.id)
    
  end
  
def edit
    @user = User.find(params[:id])
  end
  
def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
def create
  @user = User.new(user_params)
  if @user.save
  	redirect_to @user
  else
    flash[:error] = 'Invalid email/password combination'
  	render 'new'
  end
  
end

def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
end

def join
	@user = User.find(current_user)
	@team = Team.find(params[:team_id])
	@user.update_attribute(:team, @team)
end

private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, 
									:password, :password_confirmation, :admin)
	end
	
	def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def current_user?(user)
    	user == current_user
  	end
  
  	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end
