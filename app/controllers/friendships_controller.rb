class FriendshipsController < ApplicationController

    def create
      @friend = User.find(params[:id])
      @friend.followers << current_user
      redirect_to @friend
    end

    def destroy
      @friend = User.find(params[:id])
      if @friend
        Following.find_by(follower_id: current_user.id, followed_id: @friend.id).destroy
        redirect_to @friend
      end
    end
end
