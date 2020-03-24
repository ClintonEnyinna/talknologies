class SessionsController < ApplicationController
    def new
    end

    def create
      @user = User.find_by(username: params[:sessions][:username])
      if @user
        session[:user_id] = @user.id
        redirect_to login_path
      else
        render 'new'
      end
    end

    def destroy
      session.delete(:user_id)
    end

    private 
    
    def user_params
      params.require(:session).permit(:username)
    end
end
