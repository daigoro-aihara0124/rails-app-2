class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password_digest])
      session[:user_id] = @user.id
      flash[:notice] = "ログインが完了しました"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが間違っています"
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to :users
  end

end
