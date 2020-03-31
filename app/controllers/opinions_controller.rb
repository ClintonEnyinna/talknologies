class OpinionsController < ApplicationController
  before_action :require_login

  def index
    @users = current_user.can_follow
    @opinions = Opinion.all.includes(:author)
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @opinion = @user.opinions.build(opinion_param)
    @opinion.save
    redirect_to root_path
  end

  private

  def require_login
    redirect_to login_path unless current_user
  end

  def opinion_param
    params.require(:opinion).permit(:text)
  end
end
