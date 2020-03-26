class AddUsersReferencesToFollowing < ActiveRecord::Migration[5.2]
  def change
    add_reference :followings, :follower, references: :user, foreign_key: true
    add_reference :followings, :followed, references: :user, foreign_key: true
  end
end
