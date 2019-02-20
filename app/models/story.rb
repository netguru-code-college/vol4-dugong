class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :location
  has_one_attached :picture
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  attr_accessor :latitude, :longitude
end
