class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:likes, :comments)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      redirect_to user_path(id: @post.author_id), notice: 'Post was successfully created.'
    else
      render :new, alert: 'Post was not successfully created.'
    end
  end

  def post_params
    params.permit(:title, :text)
  end
end
