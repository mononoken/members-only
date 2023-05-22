class PostsController < ApplicationController
  before_action :require_login, except: %i[index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def require_login
    return if logged_in?

    flash[:error] = 'You must be logged in to access this section'

    redirect_to new_login_url
  end
end
