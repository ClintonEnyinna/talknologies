class User < ApplicationRecord
  before_create :image_nil

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :fullname, presence: true

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followed_id, class_name: "Following"
  has_many :followers, through: :following_users

  has_one_attached :image

  def image_nil
    if !self.image.attached?
      self.image.attach(io: File.open('app/assets/images/default.jpeg'), filename: 'default.jpeg', content_type: 'image/jpeg')
    end
  end
end
