class FriendshipsController < ApplicationController
  def create
    @friend = User.find(params[:id])
    follow(@friend)
    redirect_to @friend
  end

  def destroy
    @friend = User.find(params[:id])
    unfollow(@friend)
    redirect_to @friend
  end
end
