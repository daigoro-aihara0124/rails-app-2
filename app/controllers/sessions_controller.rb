class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password_digest])
      log_in @user
      flash[:notice] = "ログインが完了しました"
      redirect_to :users
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが間違っています"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to :users
  end

end
