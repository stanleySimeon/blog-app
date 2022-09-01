class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author, :comments)
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

    respond_to do |format|
      format.html do
        if @post.save
            flash[:success] = 'Post was successfully created.'
            redirect_to user_posts_path(current_user)
        else
          flash.now[:error] = 'Post was not created.'
          render.new
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.author_id
    respond_to do |format|
      format.html do
        if @post.destroy
          @post.user.decrement!(:posts_counter)
          flash[:success] = 'Post was successfully deleted.'
          redirect_to user_posts_path(@user)
        else
          flash.now[:error] = 'Post was not deleted.'
          render.show
        end
      end
    end
  end

  def post_params
    params.permit(:title, :text)
  end
end
