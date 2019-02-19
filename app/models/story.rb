class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :picture
  has_many :comments
end
