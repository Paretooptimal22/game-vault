class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :rental
end
