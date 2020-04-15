class AddReferencesToLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :user, foreign_key: true, index: true
    add_reference :likes, :opinion, foreign_key: true, index: true
  end
end
