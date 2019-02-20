class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :location
  has_one_attached :picture
  has_many :comments
  has_many :votes, dependent: :destroy
end
