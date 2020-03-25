class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :fullname, presence: true

  has_many :opinions, foreign_key: 'author_id'
end
