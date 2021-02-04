class PostsController < ApplicationController
  before_action :authenticate, only: [:new, :create]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      flash[:notice] = "ユーザーID「#{@post.user_id}」のルーム登録をしました"
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = @current_user.posts
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:name, :introduction, :fee, :address, :image, :user_id))
      flash[:notice] = "ルームの編集をしました"
      redirect_to post_path(@post)
    else
      redirect_to edit_post_path(@post)
    end
  end

  def search
    if params[:keyword].present?
      @posts = Post.where('name LIKE ? OR address LIKE ? ', "%#{params[:keyword]}%","%#{params[:keyword]}%" )
    else
      @posts = Post.none
    end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:name, :introduction, :fee, :address, :image, :user_id)
  end
 end
