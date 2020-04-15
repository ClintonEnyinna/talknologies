class AddUniquenessConstraintToLikes < ActiveRecord::Migration[5.2]
  def change
    remove_index :likes, :user_id
    remove_index :likes, :opinion_id
    add_index :likes, [:user_id, :opinion_id], unique: true
  end
end
