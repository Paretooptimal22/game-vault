class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :rentals
end
