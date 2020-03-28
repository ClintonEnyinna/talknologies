module FriendshipsHelper
  
  def follow(friend)
    @friend.followers << current_user
  end

  def unfollow(friend)
    Following.find_by(follower_id: current_user.id, followed_id: friend.id).destroy
  end
end
