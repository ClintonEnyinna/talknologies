class User < ApplicationRecord

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :fullname, presence: true

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :following_users

  has_one_attached :image
  has_one_attached :cover

  def thumbnail
    return 'default.jpg' unless image.attached?
    image.variant(resize: '50x50!')
  end

  def profile
    return 'default.jpg' unless image.attached?
    image.variant(resize: '150x150!')
  end

  def cover_photo
    return 'default.jpg' unless cover.attached?
    cover.variant(resize: '1110x400!')
  end

  def cannot_follow?(user)
    self == user ||
      followees.where(username: user.username).exists?
  end
end
