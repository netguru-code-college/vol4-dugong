class User < ApplicationRecord
  has_many :stories
  has_many :comments
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers

  def follow(user)
    followers.create(followable: user)
  end

  def unfollow(user)
    followers.find_by(followable: user).destroy
  end

  def follow?(user)
    followers.where(followable: user).exists?
  end
end
