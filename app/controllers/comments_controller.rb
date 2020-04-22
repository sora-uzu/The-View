class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(content: params[:comment][:content], post_id: params[:post_id])
    @post = Post.find(params[:post_id])
  end

  def destroy
    @comment = Comment.find_by(post_id: params[:post_id], id: params[:id])
    @comment.delete
    @post = Post.find(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment, :post_id).permit(:content)
  end
end
