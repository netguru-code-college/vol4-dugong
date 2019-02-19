class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :picture
<<<<<<< HEAD
  has_many :comments
=======
  has_many :votes, dependent: :destroy
>>>>>>> Add votes, no logic
end
