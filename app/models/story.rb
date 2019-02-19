class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :picture
  has_many :comments
  has_many :votes, dependent: :destroy
end
