class OpinionsController < ApplicationController
  before_action :require_login

  def index
    @opinions = Opinion.all.includes(:user)
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @opinion = @user.opinions.build(opinion_param)
    @opinion.save
    redirect_to root_path
  end

  private

  def require_login
    redirect_to login_path unless session[:user_id]
  end

  def opinion_param
    params.require(:opinion).permit(:text)
  end
end
