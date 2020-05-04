# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = if params[:q]
               @q.result.order('created_at DESC').page(params[:page]).per(8)
             else
               User.order('created_at DESC').page(params[:page]).without_count.per(8)
             end
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) if current_user != @user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(9)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.order('created_at DESC').page(params[:page]).without_count.per(8)
    render 'index'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.order('created_at DESC').page(params[:page]).without_count.per(8)
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
