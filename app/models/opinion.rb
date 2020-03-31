class Opinion < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  validates :text, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
