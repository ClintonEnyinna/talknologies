class FriendshipsController < ApplicationController
  def create
    @friend = User.find(params[:id])
    follow(@friend)
  end

  def destroy
    @friend = User.find(params[:id])
    unfollow(@friend)
  end
end
