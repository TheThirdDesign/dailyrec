class CommentsController < ApplicationController

def create
  @comment = Comment.create(comment_params)
  @comments = Comment.where(post_id: params[:id])
  redirect_to post_path(params[:id])
end

def edit
@comment = Comment.find_by(id: params[:id])
if @comment.likes == nil
  @comment.likes = 1
  @comment.save
  redirect_to post_path(params[:post_id])
else
  newLikes = @comment.likes + 1
  @comment.likes = newLikes
  @comment.save
  redirect_to post_path(params[:post_id])
end
end

private
  def comment_params
    params.require(:comment).permit(:name, :message, :post_id)
  end
end
