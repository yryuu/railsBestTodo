class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      remember user
      flash[:success] = "ログイン完了しました"
      redirect_to user
    else
      flash.now[:danger] = 'ユーザが存在しません'
      render 'new'
    end
  end

  def destroy 
    logout
    redirect_to users_path
  end
end
