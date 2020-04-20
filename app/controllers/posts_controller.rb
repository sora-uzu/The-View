class PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
  	@posts = if params[:q]
              @q.result
             else
              Post.all
             end
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
  	@post = current_user.posts.build
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def create
  	@post = current_user.posts.build(posts_params)
  	if @post.save
  		redirect_to current_user
  	else
  		render :new
  	end
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(posts_params)
  		redirect_to post_path(@post)
  	else
  		render :edit
  	end
  end

  	def destroy
  		@post = Post.find(params[:id])
  		@post.destroy
  		redirect_to posts_path
  	end

    def map
    @posts = Post.all
    end

  	private

  	def posts_params
  		params.require(:post).permit(
  			:title, :image, :address, :latitude, :longitude, :description)
  	end
end
