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
      flash.now[:error] = 'Comment was not created.'
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(@comment.post_id)
    @comment.destroy!
    respond_to do |format|
      format.html do
        if @comment.destroy
          @post.decrement!(:comments_counter)
          flash[:success] = 'Comment was successfully deleted.'
          redirect_to user_post_path(current_user, @comment.post.id)
        else
          flash.now[:error] = 'Comment was not deleted.'
          render.show
        end
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
