class LikesController < ApplicationController
  def create
    @like = Like.new(opinion_id: params[:opinion_id], user: current_user)
    @like.save
    redirect_to request.referrer
  end

  def destroy
    @like = Like.find_by(id: params[:id], user: current_user, opinion_id: params[:opinion_id])
    @like&.destroy
    redirect_to request.referrer
  end
end
