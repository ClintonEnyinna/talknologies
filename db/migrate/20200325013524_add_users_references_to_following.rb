class AddUsersReferencesToFollowing < ActiveRecord::Migration[5.2]
  def change
    add_reference :followings, :follower, foreign_key: { to_table: :users }
    add_reference :followings, :followed, foreign_key: { to_table: :users }
  end
end
