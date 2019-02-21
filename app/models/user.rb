class User < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers, dependent: :destroy

  def follow(user)
    followers.create(followable: user)
    Notification.create(notify_type: 'follower', actor: self, user: user)
  end

  def unfollow(user)
    followers.find_by(followable: user).destroy
  end

  def follow?(user)
    followers.where(followable: user).exists?
  end
end
