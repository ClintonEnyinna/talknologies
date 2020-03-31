module UsersHelper
  def current_user?(user)
    user == current_user
  end

  def followers(user)
    user.followers
  end

  def cannot_follow?(user)
    current_user == user ||
    current_user.followees.where(username: user.username).exists?
  end
end
