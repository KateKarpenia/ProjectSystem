class UsersController < ApplicationController

def index
    @user = User.all
  end

def show
    @user = User.find(params[:id])
    
  end
  
def create
  @user = User.new(params[:user])
  user.admin=true
  @user.save!
  redirect_to @user
end


end
