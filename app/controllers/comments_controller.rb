class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_posts_path(user_id: @post.author_id, id: @post.id), notice: 'Comment was successfully created.'
    else
      render :new, alert: 'Comment was not found.'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
