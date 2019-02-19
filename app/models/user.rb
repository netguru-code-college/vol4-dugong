class User < ApplicationRecord
  has_many :stories
<<<<<<< HEAD
  has_many :comments
=======
  has_many :votes
>>>>>>> Add votes, no logic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD
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
=======
  has_many :followers, as: :followable
>>>>>>> Add votes, no logic
end
