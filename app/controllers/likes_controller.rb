class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post.id)

    if @like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id), notice: 'Like was successfully created.'
    else
      render :new, alert: 'Likes was not successfully created.'
    end
  end
end
