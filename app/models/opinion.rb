class Opinion < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user, foreign_key: 'author_id'
end
