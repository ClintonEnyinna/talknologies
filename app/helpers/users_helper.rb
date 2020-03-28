module UsersHelper
  def current_user?(user)
    user == current_user
  end

  def followers(user)
    user.followers
  end
end
