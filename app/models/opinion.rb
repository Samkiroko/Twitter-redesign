class Opinion < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { maximum: 250 }

  scope :following_opinions, lambda { |user|
                               includes(:user).where('user_id IN (?)',
                                                     (user.followings.map(&:followed_id) << user.id))
                                 .order(created_at: :desc)
                             }
end
