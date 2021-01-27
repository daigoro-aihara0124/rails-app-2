class PostsController < ApplicationController

  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:name, :introduction, :fee, :address, :image, :user_id))
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "「#{@post.user_id}」のルーム登録をしました"
      redirect_to :users
    else
      render "posts/new"
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
