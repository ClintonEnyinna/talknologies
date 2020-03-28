class AddReferencesToOpinions < ActiveRecord::Migration[5.2]
  def change
    add_reference :opinions, :author, foreign_key: { to_table: :users }, index: true
  end
end
