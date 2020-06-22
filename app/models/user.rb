class User < ApplicationRecord
  before_destroy :remove_followings

  has_many :opinions, dependent: :destroy
  has_many :followings, foreign_key: :follower_id
  has_many :followers, class_name: :Following, foreign_key: :followed_id

  validates :username, uniqueness: true, presence: true, length: { maximum: 25 }
  validates :full_name, presence: true, length: { maximum: 50 }
  validate :photo_size
  validate :cover_size

  mount_uploader :photo, PhotoUploader
  mount_uploader :cover_image, CoverImageUploader

  scope :not_following_opinions, lambda { |user|
                                   includes(:opinions).where('id NOT IN (?)',
                                                             (user.followings.map(&:followed_id) << user.id))
                                     .limit(10).order(created_at: :desc)
                                 }
  scope :not_following_users, lambda { |user|
                                where('id NOT IN (?)',
                                      (user.followings.map(&:followed_id) << user.id)).limit(10)
                                  .order(created_at: :desc)
                              }
  scope :following, ->(user) { where('id IN (?)', user.followings.map(&:followed_id)) }
  scope :followers, ->(user) { where('id IN (?)', user.followers.map(&:follower_id)).limit(5) }

  private

  def photo_size
    errors.add(:photo, 'should be less than 5MB') if photo.size > 5.megabytes
  end

  def cover_size
    errors.add(:cover_image, 'should be less than 5MB') if cover_image.size > 5.megabytes
  end

  def remove_followings
    Following.where(followed_id: id).destroy_all
    Following.where(follower_id: id).destroy_all
  end
end
