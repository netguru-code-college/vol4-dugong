class Category < ApplicationRecord
  ##### Uncomment  after story model is added
  # has_many :stories
  validates :name, inclusion: { in: %w(bad good) }
end
