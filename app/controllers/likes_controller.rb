class LikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    likes = Like.where(user_id: @user)
    p = []
    likes.each do |like|
      p << Post.find_by(id: like.post_id)
      @posts = Kaminari.paginate_array(p).page(params[:page]).per(9)
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @post = Post.find(params[:post_id])
    @like.destroy
  end
end
