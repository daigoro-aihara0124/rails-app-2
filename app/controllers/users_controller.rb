class UsersController < ApplicationController

  def index
    @users = User.all
    @posts = Post.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction))
    @user.image_name = "default_user.jpeg"
    if @user.save
      log_in @user
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :users
    else
      render "new"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :image_name, :email, :password, :password_confirmation, :introduction))
     flash[:notice] = "「#{@user.name}」の情報を編集しました"
     redirect_to :users
    else
    flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
    render "edit"
    end
  end


  def destroy
  end
end
