class Location < ApplicationRecord
  has_many :stories, dependent: :destroy
  belongs_to :city
end
