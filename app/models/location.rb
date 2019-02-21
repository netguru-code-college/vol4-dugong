class Location < ApplicationRecord
  has_many :stories
  belongs_to :city
end
