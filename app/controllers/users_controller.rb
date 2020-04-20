class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user.id)
  	else
  		render "edit"
  	end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'index'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'index'
  end

  def map
    @user = User.find(params[:id])
    @posts = @user.posts
    render 'map'
  end


  	private
  	def user_params
  		params.require(:user).permit(:name, :image)
  	end
end
