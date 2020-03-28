class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:sessions][:username])
    if @user
      login @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

  private

  def user_params
    params.require(:session).permit(:username)
  end
end
